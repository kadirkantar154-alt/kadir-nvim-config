return {
    -- Autocompletion engine
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            -- Snippet engine (required by nvim-cmp)
            {
                "L3MON4D3/LuaSnip",
                version = "v2.*",
                build = "make install_jsregexp",
            },

            -- Completion sources
            "saadparwaiz1/cmp_luasnip", -- Snippet completions
            "hrsh7th/cmp-nvim-lsp", -- LSP completions
            "hrsh7th/cmp-buffer", -- Buffer completions
            "hrsh7th/cmp-path",   -- Path completions
            "hrsh7th/cmp-cmdline", -- Command line completions

            -- Snippet collection (optional but useful)
            "rafamadriz/friendly-snippets",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            -- Load VSCode-style snippets
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },

                mapping = cmp.mapping.preset.insert({
                    ["<C-k>"] = cmp.mapping.select_prev_item(), -- Previous suggestion
                    ["<C-j>"] = cmp.mapping.select_next_item(), -- Next suggestion
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),   -- Show completion
                    ["<C-e>"] = cmp.mapping.abort(),          -- Close completion
                    ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Confirm selection

                    -- Tab to navigate or expand snippet
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),

                sources = cmp.config.sources({
                    { name = "nvim_lsp" }, -- LSP
                    { name = "luasnip" }, -- Snippets
                    { name = "buffer" }, -- Text in buffer
                    { name = "path" }, -- File paths
                }),

                -- Completion window appearance
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

                formatting = {
                    format = function(entry, vim_item)
                        -- Source name
                        vim_item.menu = ({
                            nvim_lsp = "[LSP]",
                            luasnip = "[Snippet]",
                            buffer = "[Buffer]",
                            path = "[Path]",
                        })[entry.source.name]
                        return vim_item
                    end,
                },
            })

            -- Command line completion
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" }
                }, {
                    { name = "cmdline" }
                })
            })

            -- Search completion
            cmp.setup.cmdline("/", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" }
                }
            })
        end,
    },
}

return {
  "sindrets/diffview.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewToggleFiles",
    "DiffviewFocusFiles",
    "DiffviewRefresh",
    "DiffviewFileHistory",
  },
  keys = {
    -- Open diff view for current changes
    { "<leader>gdo", "<cmd>DiffviewOpen<CR>", desc = "Open Diffview" },
    
    -- Compare with a specific commit/branch
    { "<leader>gdm", "<cmd>DiffviewOpen main<CR>", desc = "Diff with main branch" },
    
    -- File history for current file
    { "<leader>gdh", "<cmd>DiffviewFileHistory %<CR>", desc = "File history (current)" },
    
    -- File history for entire project
    { "<leader>gdH", "<cmd>DiffviewFileHistory<CR>", desc = "File history (project)" },
    
    -- Close diffview
    { "<leader>gdc", "<cmd>DiffviewClose<CR>", desc = "Close Diffview" },
  },
  config = function()
    local actions = require("diffview.actions")
    
    require("diffview").setup({
      diff_binaries = false,
      enhanced_diff_hl = true, -- Better syntax highlighting in diffs
      use_icons = true,
      
      -- Show which files have been staged/unstaged
      show_help_hints = true,
      
      -- File panel settings
      file_panel = {
        listing_style = "tree", -- or "list"
        tree_options = {
          flatten_dirs = true,
          folder_statuses = "only_folded",
        },
        win_config = {
          position = "left",
          width = 35,
        },
      },
      
      -- File history panel
      file_history_panel = {
        log_options = {
          git = {
            single_file = {
              diff_merges = "combined",
            },
            multi_file = {
              diff_merges = "first-parent",
            },
          },
        },
        win_config = {
          position = "bottom",
          height = 16,
        },
      },
      
      -- Commit log panel
      commit_log_panel = {
        win_config = {
          position = "bottom",
          height = 16,
        },
      },
      
      -- Default arguments for DiffviewOpen
      default_args = {
        DiffviewOpen = {},
        DiffviewFileHistory = {},
      },
      
      -- Keymaps for the diffview
      keymaps = {
        disable_defaults = false,
        view = {
          -- Navigation between files
          { "n", "<tab>", actions.select_next_entry, { desc = "Next file" } },
          { "n", "<s-tab>", actions.select_prev_entry, { desc = "Previous file" } },
          
          -- Focus file panel
          { "n", "gf", actions.goto_file_edit, { desc = "Open file" } },
          { "n", "<C-w><C-f>", actions.goto_file_split, { desc = "Open in split" } },
          { "n", "<C-w>gf", actions.goto_file_tab, { desc = "Open in tab" } },
          
          -- Toggle file panel
          { "n", "e", actions.focus_files, { desc = "Focus file panel" } },
          { "n", "b", actions.toggle_files, { desc = "Toggle file panel" } },
          
          -- Stage/unstage hunks
          { "n", "<leader>gs", actions.toggle_stage_entry, { desc = "Stage/unstage" } },
          { "n", "<leader>ga", actions.stage_all, { desc = "Stage all" } },
          { "n", "<leader>gu", actions.unstage_all, { desc = "Unstage all" } },
          
          -- Navigation within diff
          { "n", "[x", actions.prev_conflict, { desc = "Previous conflict" } },
          { "n", "]x", actions.next_conflict, { desc = "Next conflict" } },
          
          -- Close
          { "n", "q", "<cmd>DiffviewClose<CR>", { desc = "Close Diffview" } },
          { "n", "<esc>", "<cmd>DiffviewClose<CR>", { desc = "Close Diffview" } },
        },
        
        diff1 = {
          -- Single panel diff (3-way merge view)
          { "n", "g?", actions.help({ "view", "diff1" }), { desc = "Open help" } },
        },
        
        diff2 = {
          -- Two panel diff
          { "n", "g?", actions.help({ "view", "diff2" }), { desc = "Open help" } },
        },
        
        diff3 = {
          -- Three panel diff (merge conflicts)
          { { "n", "x" }, "2do", actions.diffget("ours"), { desc = "Get ours" } },
          { { "n", "x" }, "3do", actions.diffget("theirs"), { desc = "Get theirs" } },
        },
        
        diff4 = {
          -- Four panel diff (advanced merge)
          { { "n", "x" }, "1do", actions.diffget("base"), { desc = "Get base" } },
          { { "n", "x" }, "2do", actions.diffget("ours"), { desc = "Get ours" } },
          { { "n", "x" }, "3do", actions.diffget("theirs"), { desc = "Get theirs" } },
        },
        
        file_panel = {
          -- File panel navigation
          { "n", "j", actions.next_entry, { desc = "Next file" } },
          { "n", "k", actions.prev_entry, { desc = "Previous file" } },
          { "n", "<cr>", actions.select_entry, { desc = "Open diff" } },
          { "n", "o", actions.select_entry, { desc = "Open diff" } },
          { "n", "<2-LeftMouse>", actions.select_entry, { desc = "Open diff" } },
          
          -- Stage/unstage
          { "n", "-", actions.toggle_stage_entry, { desc = "Stage/unstage" } },
          { "n", "s", actions.toggle_stage_entry, { desc = "Stage/unstage" } },
          { "n", "S", actions.stage_all, { desc = "Stage all" } },
          { "n", "U", actions.unstage_all, { desc = "Unstage all" } },
          
          -- Restore
          { "n", "X", actions.restore_entry, { desc = "Restore file" } },
          
          -- Refresh
          { "n", "R", actions.refresh_files, { desc = "Refresh" } },
          
          -- Focus
          { "n", "L", actions.open_commit_log, { desc = "Open commit log" } },
          { "n", "e", actions.focus_entry, { desc = "Focus entry" } },
          { "n", "b", actions.toggle_files, { desc = "Toggle file panel" } },
          
          -- Collapse/expand
          { "n", "zo", actions.open_fold, { desc = "Expand fold" } },
          { "n", "zc", actions.close_fold, { desc = "Collapse fold" } },
          { "n", "za", actions.toggle_fold, { desc = "Toggle fold" } },
          { "n", "zR", actions.open_all_folds, { desc = "Expand all" } },
          { "n", "zM", actions.close_all_folds, { desc = "Collapse all" } },
          
          -- Close
          { "n", "q", "<cmd>DiffviewClose<CR>", { desc = "Close Diffview" } },
          { "n", "<esc>", "<cmd>DiffviewClose<CR>", { desc = "Close Diffview" } },
          
          -- Help
          { "n", "g?", actions.help("file_panel"), { desc = "Open help" } },
        },
        
        file_history_panel = {
          -- Navigation
          { "n", "g!", actions.options, { desc = "Options" } },
          { "n", "<C-A-d>", actions.open_in_diffview, { desc = "Open in diffview" } },
          { "n", "y", actions.copy_hash, { desc = "Copy commit hash" } },
          { "n", "L", actions.open_commit_log, { desc = "Show commit details" } },
          { "n", "zR", actions.open_all_folds, { desc = "Expand all" } },
          { "n", "zM", actions.close_all_folds, { desc = "Collapse all" } },
          { "n", "j", actions.next_entry, { desc = "Next commit" } },
          { "n", "k", actions.prev_entry, { desc = "Previous commit" } },
          { "n", "<cr>", actions.select_entry, { desc = "Open diff" } },
          { "n", "o", actions.select_entry, { desc = "Open diff" } },
          { "n", "<2-LeftMouse>", actions.select_entry, { desc = "Open diff" } },
          
          -- Close
          { "n", "q", "<cmd>DiffviewClose<CR>", { desc = "Close Diffview" } },
          { "n", "<esc>", "<cmd>DiffviewClose<CR>", { desc = "Close Diffview" } },
          
          -- Help
          { "n", "g?", actions.help("file_history_panel"), { desc = "Open help" } },
        },
        
        option_panel = {
          { "n", "<tab>", actions.select_entry, { desc = "Select" } },
          { "n", "q", actions.close, { desc = "Close" } },
          { "n", "g?", actions.help("option_panel"), { desc = "Open help" } },
        },
        
        help_panel = {
          { "n", "q", actions.close, { desc = "Close help" } },
          { "n", "<esc>", actions.close, { desc = "Close help" } },
        },
      },
    })
  end,
}

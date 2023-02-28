return {
  settings = {
    Lua = {
      telemetry = { enable = false },
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
      -- https://github.com/LuaLS/vscode-lua/blob/master/setting/schema.json
      -- typeFormat = {
      --   config = {
      --     auto_complete_end = "true",
      --     auto_complete_table_sep = "true",
      --     format_line = "true",
      --   },
      -- },
      format = {
        enable = true,
        -- Put format options here
        -- NOTE: the value should be STRING!!
        -- https://github.com/CppCXY/EmmyLuaCodeStyle/blob/master/lua.template.editorconfig
        defaultConfig = {

          -- -- # [basic]
          -- indent_style = "space",
          -- indent_size = "4",
          -- tab_width = "4",
          -- quote_style = "none",
          -- continuation_indent = "4",
          -- max_line_length = "120",
          -- end_of_line = "auto",
          -- trailing_table_separator = "keep",
          -- call_arg_parentheses = "keep",
          -- detect_end_of_line = "false",
          -- insert_final_newline = "true",

          -- -- # [space]
          -- space_around_table_field_list = "true",
          -- space_before_attribute = "true",
          -- space_before_function_open_parenthesis = "false",
          -- space_before_function_call_open_parenthesis = "false",
          -- space_before_closure_open_parenthesis = "true",
          -- space_before_function_call_single_arg = "always",
          -- space_before_open_square_bracket = "false",
          -- space_inside_function_call_parentheses = "false",
          -- space_inside_function_param_list_parentheses = "false",
          -- space_inside_square_brackets = "false",
          -- space_around_table_append_operator = "false",
          -- ignore_spaces_inside_function_call = "false",
          -- space_before_inline_comment = "1",
          -- space_around_math_operator = "true",
          -- space_after_comma = "true",
          -- space_after_comma_in_for_statement = "true",
          -- space_around_concat_operator = "true",

          -- -- # [align]
          -- align_call_args = "false",
          -- align_function_params = "true",
          -- align_continuous_assign_statement = "true",
          -- align_continuous_rect_table_field = "true",
          -- align_if_branch = "false",
          -- align_array_table = "true",

          -- -- # [indent]
          -- never_indent_before_if_condition = "false",
          -- never_indent_comment_on_if_branch = "false",

          -- -- # [line space]
          -- line_space_after_if_statement = "keep",
          -- line_space_after_do_statement = "keep",
          -- line_space_after_while_statement = "keep",
          -- line_space_after_repeat_statement = "keep",
          -- line_space_after_for_statement = "keep",
          -- line_space_after_local_or_assign_statement = "keep",
          -- line_space_after_function_statement = "fixed(2)",
          -- line_space_after_expression_statement = "keep",
          -- line_space_after_comment = "keep",

          -- -- # [line break]
          -- break_all_list_when_line_exceed = "false",
          -- auto_collapse_lines = "false",

          -- -- # [preference]
          -- ignore_space_after_colon = "false",
          -- remove_call_expression_list_finish_comma = "false",
        },
      },
    },
  },
}

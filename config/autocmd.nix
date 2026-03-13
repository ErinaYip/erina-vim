{
  autoGroups = {
    auto_close_unedited = {
      clear = true;
    };
  };

  autoCmd = [
    {
      event = [ "InsertEnter" "TextChanged" ];
      group = "auto_close_unedited";
      callback = {
        __raw = ''
          function(args)
            vim.b[args.buf].ever_edited = true
          end
        '';
      };
    }

    {
      event = "BufHidden";
      group = "auto_close_unedited";
      callback = {
        __raw = ''
          function(args)
            local buf = args.buf

            if vim.bo[buf].buftype ~= "" or vim.bo[buf].filetype == "" then
              return
            end

            local ever_edited = vim.b[buf].ever_edited
            local is_modified = vim.bo[buf].modified

            if not ever_edited and not is_modified then
              vim.schedule(function()
                if vim.api.nvim_buf_is_valid(buf) and vim.fn.bufwinnr(buf) == -1 then
                  vim.api.nvim_buf_delete(buf, { force = false })
                end
              end)
            end
          end
        '';
      };
    }
  ];
}

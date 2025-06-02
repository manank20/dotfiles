local dap = require('dap')

dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}


dap.configurations.c = {
  {
    name = 'Attach to gdbserver',
    type = 'gdb',
    request = 'attach',
    -- target = 'localhost:11000',
    target = function()
      return vim.fn.input('IP and Port of the remote: ')
    end,
    program = function()
       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}'
  }
}

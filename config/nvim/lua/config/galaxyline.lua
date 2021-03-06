local gl = require('galaxyline')
local condition = require('galaxyline.condition')
local gls = gl.section

gl.short_line_list = {'NvimTree','vista','dbui', 'packer'}

local colors = {
  bg = '#32302f',
  line_bg = '#282828',
  fg = '#ebdbb2',

  yellow = '#fabd2f',
  cyan = '#8ec07c',
  darkblue = '#458588',
  green = '#b8bb26',
  orange = '#fe8019',
  purple = '#b16286',
  magenta = '#d3869b',
  blue = '#83a598',
  red = '#fb4934',
  gray = '#1d2021',
  lightgray = '#a89984'
}

gls.left[1] = {
  FirstElement = {
    provider = function() return '▊ ' end,
    highlight = {colors.blue,colors.line_bg}
  },
}

gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {n = colors.magenta, i = colors.green,v=colors.blue,[''] = colors.blue,V=colors.blue,
                          c = colors.red,no = colors.magenta,s = colors.orange,S=colors.orange,
                          [''] = colors.orange,ic = colors.yellow,R = colors.purple,Rv = colors.purple,
                          cv = colors.red,ce=colors.red, r = colors.cyan,rm = colors.cyan, ['r?'] = colors.cyan,
                          ['!']  = colors.red,t = colors.red}
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
      return ' '
    end,
    highlight = {colors.red,colors.line_bg,'bold'},
  },
}

gls.left[3] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.line_bg},
  },
}

gls.left[4] = {
  FileName = {
    provider = {'FileName','FileSize'},
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.line_bg,'bold'}
  },
}

gls.left[5] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = condition.check_git_workspace,
    highlight = {colors.orange,colors.line_bg},
  },
}

gls.left[6] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    highlight = {colors.fg,colors.line_bg,'bold'},
  },
}

gls.left[7] = {
  DiffAdd = {
    provider = "DiffAdd",
    condition = condition.checkwidth,
    icon = "   ",
    highlight = {colors.green, colors.line_bg}
  },
}

gls.left[8] = {
  DiffModified = {
    provider = "DiffModified",
    condition = condition.checkwidth,
    icon = "   ",
    highlight = {colors.orange, colors.line_bg}
  },
}

gls.left[9] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = condition.checkwidth,
    icon = "   ",
    highlight = {colors.red, colors.line_bg}
  },
}

gls.left[10] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '   ',
    highlight = {colors.red,colors.line_bg}
  },
}

gls.left[11] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '   ',
    highlight = {colors.blue,colors.line_bg},
  },
}

gls.right[1]= {
  FileFormat = {
    provider = 'FileFormat',
    separator = ' ',
    separator_highlight = {colors.line_bg,colors.line_bg},
    highlight = {colors.fg,colors.line_bg},
  },
}
gls.right[2] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' | ',
    separator_highlight = {colors.blue,colors.line_bg},
    highlight = {colors.fg,colors.line_bg},
  },
}

gls.right[3] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {colors.line_bg,colors.line_bg},
    highlight = {colors.fg,colors.darkblue},
  },
}

gls.right[4] = {
  ScrollBar = {
    provider = 'ScrollBar',
    highlight = {colors.lightgray,colors.gray},
  },
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',colors.line_bg},
    highlight = {colors.blue,colors.line_bg,'bold'}
  }
}

gls.short_line_left[2] = {
  SFileName = {
    provider =  'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.line_bg,'bold'}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.fg,colors.line_bg}
  }
}

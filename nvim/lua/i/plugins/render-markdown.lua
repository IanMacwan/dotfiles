return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },
    config = function(_, opts)
        local colors = {
            { fg = '#cc241d', bg = '#402726' },
            { fg = '#d79921', bg = '#423826' },
            { fg = '#98971a', bg = '#383825' },
            { fg = '#689d6a', bg = '#313931' },
            { fg = '#458588', bg = '#2c3536' },
            { fg = '#b16286', bg = '#3c3036' },
        }

        for i, color in ipairs(colors) do
            vim.api.nvim_set_hl(0, 'RenderMarkdownH' .. i, { fg = color.fg, bold = true })
            vim.api.nvim_set_hl(0, 'RenderMarkdownH' .. i .. 'Bg', { bg = color.bg })
            vim.api.nvim_set_hl(0, '@markup.heading.' .. i .. '.markdown', { fg = color.fg, bold = true })
        end

        require('render-markdown').setup(opts)
    end,
    opts = {
        heading = { position = 'inline', width = 'block', icons = { '-> ' } },
        checkbox = {
            unchecked = { icon = '✘ ' },
            checked = { icon = '✔ ', scope_highlight = '@markup.strikethrough' },
            custom = { todo = { rendered = '󰥔 ' } },
        },
        render_modes = { 'n', 'c', 't', 'i' }
    },
}

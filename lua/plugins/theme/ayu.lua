local status, ayu = pcall(require, "ayu")

if not status then
    return
end

ayu.setup({
    mirage = true,
    overrides = {},
})

ayu.colorscheme()

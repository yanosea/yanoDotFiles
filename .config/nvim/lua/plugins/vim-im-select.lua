local osName = os.getenv("OS")
if osName == 'Darwin' then
  return {
    {
      -- https://github.com/yoshida-m-3/vim-im-select
      'yoshida-m-3/vim-im-select',
      lazy = false,
    },
  }
end

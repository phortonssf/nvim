
local yaml_attach = function(_,bufnr )
  -- Short-circuit for Helm template files
	  if vim.bo[bufnr].buftype ~= '' or vim.bo[bufnr].filetype == 'helm' then
		vim.diagnostic.disable(bufnr)
		vim.defer_fn(function()
			vim.diagnostic.reset(nil, bufnr)
		end, 1000)
		return
end
require('lspconfig').yamlls.setup{
    on_attach=yaml_attach,
    
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
settings = {
      yaml = {
        trace = {
          -- server = "verbose"
        },
        schemas = {
          kubernetes = "/*.yaml"
        },
        -- schemaDownload = {  enable = true },
      	validate = true,
      }
    },
    -- settings = {
    --     yaml = {
    --         schemas = {
    --              ["https://raw.githubusercontent.com/quantumblacklabs/kedro/develop/static/jsonschema/kedro-catalog-0.17.json"]= "conf/**/*catalog*",
    --              ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
    --             kubernetes = "globPattern"
    --         }
    --     }
    -- }
}
end

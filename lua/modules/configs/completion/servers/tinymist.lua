return {
	cmd = { "tinymist" },
	filetypes = { "typst" },
	root_dir = function(fname)
		return vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
	end,
	single_file_support = true,
	settings = {
		exportPdf = "onSave",
		outputPath = "$root/target/$dir/$name",
	},
}

return {
    filetypes = {
        "java",
    },

    settings = {
        java = {
            eclipse = {
                downloadSources = true,
            },

            configuration = {
                updateBuildConfiguration = "interactive",
            },

            maven = {
                downloadSources = true,
            },

            implementationsCodeLens = {
                enabled = true,
            },

            referencesCodeLens = {
                enabled = true,
            },

            references = {
                includeDecompiledSources = true,
            },

            format = {
                enabled = true,
            },
        },
    },
}

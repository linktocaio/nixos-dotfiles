{pkgs, ...}: {

  programs.vscode = {
    enable = true;

    extensions = with pkgs.vscode-extensions; [
      streetsidesoftware.code-spell-checker
      # streetsidesoftware.code-spell-checker-portuguese-brazilian
      mikestead.dotenv
      dbaeumer.vscode-eslint
      esbenp.prettier-vscode
      wix.vscode-import-cost
      yoavbls.pretty-ts-errors
      humao.rest-client
      # vitest.explorer

      github.copilot

      # monokai.theme-monokai-pro-vscode
      equinusocio.vsc-material-theme-icons
      # miguelsolorio.fluent-icons
    ];

    userSettings = { 
        "symbols.hidesExplorerArrows"= false;
        "symbols.files.associations"= {
            "*.module.ts"= "nest";
            "*.guard.ts"= "typescript";
            "*.spec.ts"= "ts-test";
            "*.e2e-spec.ts"= "ts-test";
            "vitest.config.e2e.ts"= "vite";
            ".env.example"= "gear";
        };

        # "workbench.productIconTheme"= "fluent-icons";

        # FONT --------------------------------------------------------------------
        "editor.fontFamily"= "Fira Code";
        "editor.fontSize"= 14;
        "editor.fontLigatures"= true;
        # "editor.lineHeight"= 1.5;

        # CODE SCREEN --------------------------------------------------------------------
        "editor.rulers"= [80 120];
        "editor.renderLineHighlight"= "gutter";
        "workbench.editor.labelFormat"= "short";
        "editor.parameterHints.enabled"= true;
        "notebook.lineNumbers"= "on";
        "workbench.editor.empty.hint"= "hidden";
        # "editor.scrollbar.vertical"= "hidden";
        # "editor.hideCursorInOverviewRuler"= true;

        # EDITOR BEHAVIOR --------------------------------------------------------------------
        "telemetry.telemetryLevel"= "off";
        # "workbench.activityBar.location"= "hidden";
        "window.titleBarStyle"= "custom";
        # "window.commandCenter"= false;
        # "window.density.editorTabHeight"= "compact";

        "editor.acceptSuggestionOnCommitCharacter"= false;
        "security.promptForLocalFileProtocolHandling"= false;

        "extensions.ignoreRecommendations"= true;

        "editor.semanticHighlighting.enabled"= false;

        "security.workspace.trust.untrustedFiles"= "newWindow";
        "workbench.startupEditor"= "newUntitledFile";
        "editor.accessibilitySupport"= "off";
        "update.mode"= "start";
        "update.showReleaseNotes"= false;

        "workbench.editor.enablePreview"= false;
        "workbench.editor.enablePreviewFromQuickOpen"= false;

        # EXPLORER --------------------------------------------------------------------
        "explorer.confirmDelete"= false;
        "explorer.confirmDragAndDrop"= false;
        "explorer.compactFolders"= false;
        "explorer.fileNesting.enabled"= true;
        "explorer.sortOrder"= "foldersNestsFiles";
        "explorer.fileNesting.patterns"= {
            ".clang-tidy"= ".clang-format, .clangd, compile_commands.json";
            ".env"= "*.env, .env.*, .envrc, env.d.ts";
            ".gitignore"= ".gitattributes, .gitmodules, .gitmessage, .mailmap, .git-blame*";
            ".project"= ".classpath";
            "+layout.svelte"= "+layout.ts,+layout.ts,+layout.js,+layout.server.ts,+layout.server.js,+layout.gql";
            "+page.svelte"= "+page.server.ts,+page.server.js,+page.ts,+page.js,+page.gql";
            "app.config.*"= "*.env, .babelrc*, .codecov, .cssnanorc*, .env.*, .envrc, .htmlnanorc*, .lighthouserc.*, .mocha*, .postcssrc*, .terserrc*, api-extractor.json, ava.config.*, babel.config.*, capacitor.config.*, contentlayer.config.*, cssnano.config.*, cypress.*, env.d.ts, formkit.config.*, formulate.config.*, histoire.config.*, htmlnanorc.*, i18n.config.*, ionic.config.*, jasmine.*, jest.config.*, jsconfig.*, karma*, lighthouserc.*, panda.config.*, playwright.config.*, postcss.config.*, puppeteer.config.*, rspack.config.*, sst.config.*, svgo.config.*, tailwind.config.*, tsconfig.*, tsdoc.*, uno.config.*, unocss.config.*, vitest.config.*, vuetify.config.*, webpack.config.*, windi.config.*";
            "artisan"= "*.env, .babelrc*, .codecov, .cssnanorc*, .env.*, .envrc, .htmlnanorc*, .lighthouserc.*, .mocha*, .postcssrc*, .terserrc*, api-extractor.json, ava.config.*, babel.config.*, capacitor.config.*, contentlayer.config.*, cssnano.config.*, cypress.*, env.d.ts, formkit.config.*, formulate.config.*, histoire.config.*, htmlnanorc.*, i18n.config.*, ionic.config.*, jasmine.*, jest.config.*, jsconfig.*, karma*, lighthouserc.*, panda.config.*, playwright.config.*, postcss.config.*, puppeteer.config.*, rspack.config.*, server.php, sst.config.*, svgo.config.*, tailwind.config.*, tsconfig.*, tsdoc.*, uno.config.*, unocss.config.*, vitest.config.*, vuetify.config.*, webpack.config.*, webpack.mix.js, windi.config.*";
            "astro.config.*"= "*.env, .babelrc*, .codecov, .cssnanorc*, .env.*, .envrc, .htmlnanorc*, .lighthouserc.*, .mocha*, .postcssrc*, .terserrc*, api-extractor.json, ava.config.*, babel.config.*, capacitor.config.*, contentlayer.config.*, cssnano.config.*, cypress.*, env.d.ts, formkit.config.*, formulate.config.*, histoire.config.*, htmlnanorc.*, i18n.config.*, ionic.config.*, jasmine.*, jest.config.*, jsconfig.*, karma*, lighthouserc.*, panda.config.*, playwright.config.*, postcss.config.*, puppeteer.config.*, rspack.config.*, sst.config.*, svgo.config.*, tailwind.config.*, tsconfig.*, tsdoc.*, uno.config.*, unocss.config.*, vitest.config.*, vuetify.config.*, webpack.config.*, windi.config.*";
            "BUILD.bazel"= "*.bzl, *.bazel, *.bazelrc, bazel.rc, .bazelignore, .bazelproject, WORKSPACE";
            "Cargo.toml"= ".clippy.toml, .rustfmt.toml, cargo.lock, clippy.toml, cross.toml, rust-toolchain.toml, rustfmt.toml";
            "CMakeLists.txt"= "*.cmake, *.cmake.in, .cmake-format.yaml, CMakePresets.json, CMakeCache.txt";
            "composer.json"= ".php*.cache, composer.lock, phpunit.xml*, psalm*.xml";
            "default.nix"= "shell.nix";
            "deno.json*"= "*.env, .env.*, .envrc, api-extractor.json, deno.lock, env.d.ts, import-map.json, import_map.json, jsconfig.*, tsconfig.*, tsdoc.*";
            "Containerfile"= "*.dockerfile, .devcontainer.*, .dockerignore, captain-definition, compose.*, docker-compose.*, dockerfile*";
            "Dockerfile"= "*.dockerfile, .devcontainer.*, .dockerignore, captain-definition, compose.*, docker-compose.*, dockerfile*";
            "flake.nix"= "flake.lock";
            "gatsby-config.*"= "*.env, .babelrc*, .codecov, .cssnanorc*, .env.*, .envrc, .htmlnanorc*, .lighthouserc.*, .mocha*, .postcssrc*, .terserrc*, api-extractor.json, ava.config.*, babel.config.*, capacitor.config.*, contentlayer.config.*, cssnano.config.*, cypress.*, env.d.ts, formkit.config.*, formulate.config.*, gatsby-browser.*, gatsby-node.*, gatsby-ssr.*, gatsby-transformer.*, histoire.config.*, htmlnanorc.*, i18n.config.*, ionic.config.*, jasmine.*, jest.config.*, jsconfig.*, karma*, lighthouserc.*, panda.config.*, playwright.config.*, postcss.config.*, puppeteer.config.*, rspack.config.*, sst.config.*, svgo.config.*, tailwind.config.*, tsconfig.*, tsdoc.*, uno.config.*, unocss.config.*, vitest.config.*, vuetify.config.*, webpack.config.*, windi.config.*";
            "gemfile"= ".ruby-version, gemfile.lock";
            "go.mod"= ".air*, go.sum";
            "go.work"= "go.work.sum";
            "hatch.toml"= ".editorconfig, .flake8, .isort.cfg, .python-version, hatch.toml, requirements*.in, requirements*.pip, requirements*.txt, tox.ini";
            "I*.cs"= "$(capture).cs";
            "Makefile"= "*.mk";
            "mix.exs"= ".credo.exs, .dialyzer_ignore.exs, .formatter.exs, .iex.exs, .tool-versions, mix.lock";
            "next.config.*"= "*.env, .babelrc*, .codecov, .cssnanorc*, .env.*, .envrc, .htmlnanorc*, .lighthouserc.*, .mocha*, .postcssrc*, .terserrc*, api-extractor.json, ava.config.*, babel.config.*, capacitor.config.*, contentlayer.config.*, cssnano.config.*, cypress.*, env.d.ts, formkit.config.*, formulate.config.*, histoire.config.*, htmlnanorc.*, i18n.config.*, ionic.config.*, jasmine.*, jest.config.*, jsconfig.*, karma*, lighthouserc.*, next-env.d.ts, next-i18next.config.*, panda.config.*, playwright.config.*, postcss.config.*, puppeteer.config.*, rspack.config.*, sst.config.*, svgo.config.*, tailwind.config.*, tsconfig.*, tsdoc.*, uno.config.*, unocss.config.*, vitest.config.*, vuetify.config.*, webpack.config.*, windi.config.*";
            "nuxt.config.*"= "*.env, .babelrc*, .codecov, .cssnanorc*, .env.*, .envrc, .htmlnanorc*, .lighthouserc.*, .mocha*, .nuxtignore, .nuxtrc, .postcssrc*, .terserrc*, api-extractor.json, ava.config.*, babel.config.*, capacitor.config.*, contentlayer.config.*, cssnano.config.*, cypress.*, env.d.ts, formkit.config.*, formulate.config.*, histoire.config.*, htmlnanorc.*, i18n.config.*, ionic.config.*, jasmine.*, jest.config.*, jsconfig.*, karma*, lighthouserc.*, panda.config.*, playwright.config.*, postcss.config.*, puppeteer.config.*, rspack.config.*, sst.config.*, svgo.config.*, tailwind.config.*, tsconfig.*, tsdoc.*, uno.config.*, unocss.config.*, vitest.config.*, vuetify.config.*, webpack.config.*, windi.config.*";
            "package.json"= ".browserslist*, .circleci*, .commitlint*, .cz-config.js, .czrc, .dlint.json, .dprint.json*, .editorconfig, .eslint*, .firebase*, .flowconfig, .github*, .gitlab*, .gitmojirc.json, .gitpod*, .huskyrc*, .jslint*, .knip.*, .lintstagedrc*, .markdownlint*, .node-version, .nodemon*, .npm*, .nvmrc, .pm2*, .pnp.*, .pnpm*, .prettier*, .pylintrc, .release-please*.json, .releaserc*, .ruff.toml, .sentry*, .simple-git-hooks*, .stackblitz*, .styleci*, .stylelint*, .tazerc*, .textlint*, .tool-versions, .travis*, .versionrc*, .vscode*, .watchman*, .xo-config*, .yamllint*, .yarnrc*, Procfile, apollo.config.*, appveyor*, azure-pipelines*, biome.json*, bower.json, build.config.*, bun.lockb, commitlint*, crowdin*, dangerfile*, dlint.json, dprint.json*, electron-builder.*, eslint*, firebase.json, grunt*, gulp*, jenkins*, knip.*, lerna*, lint-staged*, nest-cli.*, netlify*, nodemon*, npm-shrinkwrap.json, nx.*, package-lock.json, package.nls*.json, phpcs.xml, pm2.*, pnpm*, prettier*, pullapprove*, pyrightconfig.json, release-please*.json, release-tasks.sh, release.config.*, renovate*, rollup.config.*, rspack*, ruff.toml, simple-git-hooks*, sonar-project.properties, stylelint*, tslint*, tsup.config.*, turbo*, typedoc*, unlighthouse*, vercel*, vetur.config.*, webpack*, workspace.json, wrangler.toml, xo.config.*, yarn*";
            "Pipfile"= ".editorconfig, .flake8, .isort.cfg, .python-version, Pipfile, Pipfile.lock, requirements*.in, requirements*.pip, requirements*.txt, tox.ini";
            "pubspec.yaml"= ".metadata, .packages, all_lint_rules.yaml, analysis_options.yaml, build.yaml, pubspec.lock, pubspec_overrides.yaml";
            "pyproject.toml"= ".commitlint*, .dlint.json, .dprint.json*, .editorconfig, .eslint*, .flake8, .flowconfig, .isort.cfg, .jslint*, .lintstagedrc*, .markdownlint*, .pdm-python, .pdm.toml, .prettier*, .pylintrc, .python-version, .ruff.toml, .stylelint*, .textlint*, .xo-config*, .yamllint*, MANIFEST.in, Pipfile, Pipfile.lock, biome.json*, commitlint*, dangerfile*, dlint.json, dprint.json*, eslint*, hatch.toml, lint-staged*, pdm.lock, phpcs.xml, poetry.lock, poetry.toml, prettier*, pyproject.toml, pyrightconfig.json, requirements*.in, requirements*.pip, requirements*.txt, ruff.toml, setup.cfg, setup.py, stylelint*, tox.ini, tslint*, xo.config.*";
            "quasar.conf.js"= "*.env, .babelrc*, .codecov, .cssnanorc*, .env.*, .envrc, .htmlnanorc*, .lighthouserc.*, .mocha*, .postcssrc*, .terserrc*, api-extractor.json, ava.config.*, babel.config.*, capacitor.config.*, contentlayer.config.*, cssnano.config.*, cypress.*, env.d.ts, formkit.config.*, formulate.config.*, histoire.config.*, htmlnanorc.*, i18n.config.*, ionic.config.*, jasmine.*, jest.config.*, jsconfig.*, karma*, lighthouserc.*, panda.config.*, playwright.config.*, postcss.config.*, puppeteer.config.*, quasar.extensions.json, rspack.config.*, sst.config.*, svgo.config.*, tailwind.config.*, tsconfig.*, tsdoc.*, uno.config.*, unocss.config.*, vitest.config.*, vuetify.config.*, webpack.config.*, windi.config.*";
            "readme*"= "AUTHORS, Authors, BACKERS*, Backers*, CHANGELOG*, CITATION*, CODEOWNERS, CODE_OF_CONDUCT*, CONTRIBUTING*, CONTRIBUTORS, COPYING*, CREDITS, Changelog*, Citation*, Code_Of_Conduct*, Codeowners, Contributing*, Contributors, Copying*, Credits, GOVERNANCE.MD, Governance.md, HISTORY.MD, History.md, LICENSE*, License*, MAINTAINERS, Maintainers, RELEASE_NOTES*, Release_Notes*, SECURITY.MD, SPONSORS*, Security.md, Sponsors*, authors, backers*, changelog*, citation*, code_of_conduct*, codeowners, contributing*, contributors, copying*, credits, governance.md, history.md, license*, maintainers, release_notes*, security.md, sponsors*";
            "Readme*"= "AUTHORS, Authors, BACKERS*, Backers*, CHANGELOG*, CITATION*, CODEOWNERS, CODE_OF_CONDUCT*, CONTRIBUTING*, CONTRIBUTORS, COPYING*, CREDITS, Changelog*, Citation*, Code_Of_Conduct*, Codeowners, Contributing*, Contributors, Copying*, Credits, GOVERNANCE.MD, Governance.md, HISTORY.MD, History.md, LICENSE*, License*, MAINTAINERS, Maintainers, RELEASE_NOTES*, Release_Notes*, SECURITY.MD, SPONSORS*, Security.md, Sponsors*, authors, backers*, changelog*, citation*, code_of_conduct*, codeowners, contributing*, contributors, copying*, credits, governance.md, history.md, license*, maintainers, release_notes*, security.md, sponsors*";
            "README*"= "AUTHORS, Authors, BACKERS*, Backers*, CHANGELOG*, CITATION*, CODEOWNERS, CODE_OF_CONDUCT*, CONTRIBUTING*, CONTRIBUTORS, COPYING*, CREDITS, Changelog*, Citation*, Code_Of_Conduct*, Codeowners, Contributing*, Contributors, Copying*, Credits, GOVERNANCE.MD, Governance.md, HISTORY.MD, History.md, LICENSE*, License*, MAINTAINERS, Maintainers, RELEASE_NOTES*, Release_Notes*, SECURITY.MD, SPONSORS*, Security.md, Sponsors*, authors, backers*, changelog*, citation*, code_of_conduct*, codeowners, contributing*, contributors, copying*, credits, governance.md, history.md, license*, maintainers, release_notes*, security.md, sponsors*";
            "remix.config.*"= "*.env, .babelrc*, .codecov, .cssnanorc*, .env.*, .envrc, .htmlnanorc*, .lighthouserc.*, .mocha*, .postcssrc*, .terserrc*, api-extractor.json, ava.config.*, babel.config.*, capacitor.config.*, contentlayer.config.*, cssnano.config.*, cypress.*, env.d.ts, formkit.config.*, formulate.config.*, histoire.config.*, htmlnanorc.*, i18n.config.*, ionic.config.*, jasmine.*, jest.config.*, jsconfig.*, karma*, lighthouserc.*, panda.config.*, playwright.config.*, postcss.config.*, puppeteer.config.*, remix.*, rspack.config.*, sst.config.*, svgo.config.*, tailwind.config.*, tsconfig.*, tsdoc.*, uno.config.*, unocss.config.*, vitest.config.*, vuetify.config.*, webpack.config.*, windi.config.*";
            "requirements.txt"= ".editorconfig, .flake8, .isort.cfg, .python-version, requirements*.in, requirements*.pip, requirements*.txt, tox.ini";
            "rush.json"= ".browserslist*, .circleci*, .commitlint*, .cz-config.js, .czrc, .dlint.json, .dprint.json*, .editorconfig, .eslint*, .firebase*, .flowconfig, .github*, .gitlab*, .gitmojirc.json, .gitpod*, .huskyrc*, .jslint*, .knip.*, .lintstagedrc*, .markdownlint*, .node-version, .nodemon*, .npm*, .nvmrc, .pm2*, .pnp.*, .pnpm*, .prettier*, .pylintrc, .release-please*.json, .releaserc*, .ruff.toml, .sentry*, .simple-git-hooks*, .stackblitz*, .styleci*, .stylelint*, .tazerc*, .textlint*, .tool-versions, .travis*, .versionrc*, .vscode*, .watchman*, .xo-config*, .yamllint*, .yarnrc*, Procfile, apollo.config.*, appveyor*, azure-pipelines*, biome.json*, bower.json, build.config.*, bun.lockb, commitlint*, crowdin*, dangerfile*, dlint.json, dprint.json*, electron-builder.*, eslint*, firebase.json, grunt*, gulp*, jenkins*, knip.*, lerna*, lint-staged*, nest-cli.*, netlify*, nodemon*, npm-shrinkwrap.json, nx.*, package-lock.json, package.nls*.json, phpcs.xml, pm2.*, pnpm*, prettier*, pullapprove*, pyrightconfig.json, release-please*.json, release-tasks.sh, release.config.*, renovate*, rollup.config.*, rspack*, ruff.toml, simple-git-hooks*, sonar-project.properties, stylelint*, tslint*, tsup.config.*, turbo*, typedoc*, unlighthouse*, vercel*, vetur.config.*, webpack*, workspace.json, wrangler.toml, xo.config.*, yarn*";
            "setup.cfg"= ".editorconfig, .flake8, .isort.cfg, .python-version, MANIFEST.in, requirements*.in, requirements*.pip, requirements*.txt, setup.cfg, tox.ini";
            "setup.py"= ".editorconfig, .flake8, .isort.cfg, .python-version, MANIFEST.in, requirements*.in, requirements*.pip, requirements*.txt, setup.cfg, setup.py, tox.ini";
            "shims.d.ts"= "*.d.ts";
            "svelte.config.*"= "*.env, .babelrc*, .codecov, .cssnanorc*, .env.*, .envrc, .htmlnanorc*, .lighthouserc.*, .mocha*, .postcssrc*, .terserrc*, api-extractor.json, ava.config.*, babel.config.*, capacitor.config.*, contentlayer.config.*, cssnano.config.*, cypress.*, env.d.ts, formkit.config.*, formulate.config.*, histoire.config.*, houdini.config.*, htmlnanorc.*, i18n.config.*, ionic.config.*, jasmine.*, jest.config.*, jsconfig.*, karma*, lighthouserc.*, mdsvex.config.js, panda.config.*, playwright.config.*, postcss.config.*, puppeteer.config.*, rspack.config.*, sst.config.*, svgo.config.*, tailwind.config.*, tsconfig.*, tsdoc.*, uno.config.*, unocss.config.*, vite.config.*, vitest.config.*, vuetify.config.*, webpack.config.*, windi.config.*";
            "vite.config.*"= "*.env, .babelrc*, .codecov, .cssnanorc*, .env.*, .envrc, .htmlnanorc*, .lighthouserc.*, .mocha*, .postcssrc*, .terserrc*, api-extractor.json, ava.config.*, babel.config.*, capacitor.config.*, contentlayer.config.*, cssnano.config.*, cypress.*, env.d.ts, formkit.config.*, formulate.config.*, histoire.config.*, htmlnanorc.*, i18n.config.*, ionic.config.*, jasmine.*, jest.config.*, jsconfig.*, karma*, lighthouserc.*, panda.config.*, playwright.config.*, postcss.config.*, puppeteer.config.*, rspack.config.*, sst.config.*, svgo.config.*, tailwind.config.*, tsconfig.*, tsdoc.*, uno.config.*, unocss.config.*, vitest.config.*, vuetify.config.*, webpack.config.*, windi.config.*";
            "vue.config.*"= "*.env, .babelrc*, .codecov, .cssnanorc*, .env.*, .envrc, .htmlnanorc*, .lighthouserc.*, .mocha*, .postcssrc*, .terserrc*, api-extractor.json, ava.config.*, babel.config.*, capacitor.config.*, contentlayer.config.*, cssnano.config.*, cypress.*, env.d.ts, formkit.config.*, formulate.config.*, histoire.config.*, htmlnanorc.*, i18n.config.*, ionic.config.*, jasmine.*, jest.config.*, jsconfig.*, karma*, lighthouserc.*, panda.config.*, playwright.config.*, postcss.config.*, puppeteer.config.*, rspack.config.*, sst.config.*, svgo.config.*, tailwind.config.*, tsconfig.*, tsdoc.*, uno.config.*, unocss.config.*, vitest.config.*, vuetify.config.*, webpack.config.*, windi.config.*";
            "*.asax"= "$(capture).*.cs, $(capture).*.vb";
            "*.ascx"= "$(capture).*.cs, $(capture).*.vb";
            "*.ashx"= "$(capture).*.cs, $(capture).*.vb";
            "*.aspx"= "$(capture).*.cs, $(capture).*.vb";
            "*.axaml"= "$(capture).axaml.cs";
            "*.bloc.dart"= "$(capture).event.dart, $(capture).state.dart";
            "*.c"= "$(capture).h";
            "*.cc"= "$(capture).hpp, $(capture).h, $(capture).hxx, $(capture).hh";
            "*.cjs"= "$(capture).cjs.map, $(capture).*.cjs, $(capture)_*.cjs";
            "*.component.ts"= "$(capture).component.html, $(capture).component.spec.ts, $(capture).component.css, $(capture).component.scss, $(capture).component.sass, $(capture).component.less";
            "*.cpp"= "$(capture).hpp, $(capture).h, $(capture).hxx, $(capture).hh";
            "*.cs"= "$(capture).*.cs";
            "*.cshtml"= "$(capture).cshtml.cs";
            "*.csproj"= "*.config, *proj.user, appsettings.*, bundleconfig.json";
            "*.css"= "$(capture).css.map, $(capture).*.css";
            "*.cxx"= "$(capture).hpp, $(capture).h, $(capture).hxx, $(capture).hh";
            "*.dart"= "$(capture).freezed.dart, $(capture).g.dart";
            "*.db"= "*.db-shm, *.db-wal";
            "*.ex"= "$(capture).html.eex, $(capture).html.heex, $(capture).html.leex";
            "*.fs"= "$(capture).fs.js, $(capture).fs.js.map, $(capture).fs.jsx, $(capture).fs.ts, $(capture).fs.tsx, $(capture).fs.rs, $(capture).fs.php, $(capture).fs.dart";
            "*.go"= "$(capture)_test.go";
            "*.java"= "$(capture).class";
            "*.js"= "$(capture).js.map, $(capture).*.js, $(capture)_*.js";
            "*.jsx"= "$(capture).js, $(capture).*.jsx, $(capture)_*.js, $(capture)_*.jsx, $(capture).less, $(capture).module.less, $(capture).module.less.d.ts";
            "*.master"= "$(capture).*.cs, $(capture).*.vb";
            "*.md"= "$(capture).*";
            "*.mjs"= "$(capture).mjs.map, $(capture).*.mjs, $(capture)_*.mjs";
            "*.module.ts"= "$(capture).resolver.ts, $(capture).controller.ts, $(capture).service.ts";
            "*.mts"= "$(capture).mts.map, $(capture).*.mts, $(capture)_*.mts";
            "*.pubxml"= "$(capture).pubxml.user";
            "*.py"= "$(capture).pyi";
            "*.razor"= "$(capture).razor.cs, $(capture).razor.css, $(capture).razor.scss";
            "*.resx"= "$(capture).*.resx, $(capture).designer.cs, $(capture).designer.vb";
            "*.tex"= "$(capture).acn, $(capture).acr, $(capture).alg, $(capture).aux, $(capture).bbl, $(capture).blg, $(capture).fdb_latexmk, $(capture).fls, $(capture).glg, $(capture).glo, $(capture).gls, $(capture).idx, $(capture).ind, $(capture).ist, $(capture).lof, $(capture).log, $(capture).lot, $(capture).out, $(capture).pdf, $(capture).synctex.gz, $(capture).toc, $(capture).xdv";
            "*.ts"= "$(capture).js, $(capture).d.ts.map, $(capture).*.ts, $(capture)_*.js, $(capture)_*.ts, $(capture).*.spec.ts";
            "*.tsx"= "$(capture).ts, $(capture).*.tsx, $(capture)_*.ts, $(capture)_*.tsx, $(capture).less, $(capture).module.less, $(capture).module.less.d.ts, $(capture).scss, $(capture).module.scss, $(capture).module.scss.d.ts";
            "*.vbproj"= "*.config, *proj.user, appsettings.*, bundleconfig.json";
            "*.vue"= "$(capture).*.ts, $(capture).*.js, $(capture).story.vue";
            "*.w"= "$(capture).*.w, I$(capture).w";
            "*.xaml"= "$(capture).xaml.cs";
        };
        "files.exclude"= {
            "**/CVS"= true;
            "**/.DS_Store"= true;
            "**/.hg"= true;
            "**/.svn"= true;
            "**/.git"= true;
            # ".vscode"= true;
            # "node_modules"= true;
        };
        "files.associations"= {
            ".env.*"= "dotenv";
            ".prettierrc"= "json";
            "*.css"= "css";
            ".env*"= "dotenv";
        };

        # INTEGRATED TERMINAL --------------------------------------------------------------------
        "terminal.integrated.defaultProfile.linux"= "zsh";
        "terminal.integrated.fontFamily"= "Fira Code";
        # "terminal.integrated.gpuAcceleration"= "off";
        # "terminal.integrated.showExitAlert"= false;
        # "terminal.integrated.fontSize"= 14;

        # GIT --------------------------------------------------------------------
        "git.openRepositoryInParentFolders"= "always";
        "git.autofetch"= true;
        # "git.enableSmartCommit"= true;
        "gitlens.codeLens.recentChange.enabled"= false;
        "gitlens.codeLens.authors.enabled"= false;

        # CODE FORMATTERS --------------------------------------------------------------------
        "editor.tabSize"= 4;

        "editor.codeActionsOnSave"= {
            "source.fixAll.eslint"= "explicit";
        };
        "eslint.validate"= ["javascript" "javascriptreact" "graphql"];

        "emmet.includeLanguages"= {
            "javascript"= "javascriptreact";
        };
        "emmet.syntaxProfiles"= {
            "javascript"= "jsx";
        };

        "[html]"= {
            "editor.defaultFormatter"= "esbenp.prettier-vscode";
        };

        "[javascript]"= {
            "editor.defaultFormatter"= "esbenp.prettier-vscode";
        };
        "javascript.suggest.autoImports"= true;
        "javascript.updateImportsOnFileMove.enabled"= "always";

        "[typescript]"= {
            "editor.defaultFormatter"= "esbenp.prettier-vscode";
        };
        "typescript.tsserver.log"= "off";
        "typescript.suggest.autoImports"= true;
        "typescript.updateImportsOnFileMove.enabled"= "always";

        "[typescriptreact]"= {
            "editor.defaultFormatter"= "esbenp.prettier-vscode";
        };

        "[json]"= {
            "editor.defaultFormatter"= "esbenp.prettier-vscode";
        };

        "[css]"= {
            "editor.defaultFormatter"= "esbenp.prettier-vscode";
        };
        "tailwindCSS.experimental.classRegex"= [
            [
              "tv\\(([^)]*)\\)"
              "[\"'`]([^\"'`]*).*?[\"'`]"
            ]
        ];

        "cSpell.language"= "en,pt,pt_BR";
        "cSpell.enableFiletypes"= ["*"];
        "cSpell.userWords"= [
            "bootcamp"
            "chakra"
            "checkin"
            "checkins"
            "clsx"
            "cnpj"
            "Codegen"
            "datadog"
            "Datetime"
            "dayjs"
            "Dotenv"
            "Elysia"
            "esbuild"
            "fastify"
            "Fastify"
            "feedbackwidget"
            "ffprobe"
            "Hasher"
            "Hono"
            "ilike"
            "IUGU"
            "jamjuree"
            "jupiter"
            "liveblocks"
            "LIVEBLOCKS"
            "Marguerita"
            "middlewares"
            "mixpanel"
            "monaco"
            "nestjs"
            "omni"
            "Omni"
            "Onboarded"
            "pallas"
            "postgres"
            "postgresql"
            "prefetch"
            "reactflow"
            "roboto"
            "rocketseat"
            "rotion"
            "rsxp"
            "Sandpack"
            "shiki"
            "skylab"
            "sqlite"
            "supergraph"
            "svgr"
            "sympla"
            "tailwindcss"
            "textblock"
            "tiptap"
            "trpc"
            "TRPC"
            "tsup"
            "unfollow"
            "Unfollow"
            "unform"
            "Unform"
            "unmark"
            "upsert"
            "Usuario"
            "WEBPUSH"
        ];
        "tabnine.experimentalAutoImports"= true;
        "window.customTitleBarVisibility"= "auto";
        "workbench.productIconTheme"= "fluent-icons";
        "workbench.iconTheme"= "eq-material-theme-icons-darker";
        "workbench.colorTheme"= "Monokai Pro (Filter Spectrum)";
        "typescript.tsserver.nodePath"= "node";
        "editor.minimap.renderCharacters"= false;
        "editor.minimap.showSlider"= "always";
        "editor.minimap.enabled"= false;
        "window.menuBarVisibility"= "compact";
        "[jsonc]"= {
            "editor.defaultFormatter"= "esbenp.prettier-vscode";
        };
        "editor.tokenColorCustomizations"= {
            "[*Light*]"= {
                "textMateRules"= [
                    {
                        "scope"= "ref.matchtext";
                        "settings"= {
                            "foreground"= "#000";
                        };
                    }
                ];
            };
            "[*Dark*]"= {
                "textMateRules"= [
                    {
                        "scope"= "ref.matchtext";
                        "settings"= {
                            "foreground"= "#fff";
                        };
                    }
                ];
            };
            "textMateRules"= [
                {
                    "scope"= "keyword.other.dotenv";
                    "settings"= {
                        "foreground"= "#FF000000";
                    };
                }
            ];
        };
    };
  };
}

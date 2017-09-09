
if ENV.fetch("RAILS_ENV", "development") == "development"
  require "bootsnap"

  Bootsnap.setup cache_dir: "tmp/cache",
                 load_path_cache: true,
                 autoload_paths_cache: true,
                 disable_trace: true,
                 compile_cache_iseq: true,
                 compile_cache_yaml: true
end

let
  xdg_config = "$HOME/.config";
  xdg_cache = "$HOME/.cache";
  xdg_data = "$HOME/.local/share";
  xdg_state = "$HOME/.local/state";
in
{
  environment.sessionVariables = {
    XDG_CONFIG_HOME = xdg_config;
    XDG_CACHE_HOME = xdg_cache;
    XDG_DATA_HOME = xdg_data;
    XDG_STATE_HOME = xdg_state;

    HISTFILE = "${xdg_state}/bash/history";
    RANDFILE = "${xdg_state}/openssl/rnd";
  };
}

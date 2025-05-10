local function init()
    local opts = mp.get_property_native("options/script-opts")
    if opts and opts["http-ytproxy"] == "no" then
        return
    end

    local url = mp.get_property("stream-open-filename")
    -- check for youtube link
    if url:find("^https:") == nil or (url:find("youtu") == nil and url:find("yewtu") == nil) then
        return
    end

    local proxy = mp.get_property("http-proxy")
    local ytdl_raw_options = mp.get_property("ytdl-raw-options")
    if (proxy and proxy ~= "" and proxy ~= "http://127.0.0.1:12081") or
       (ytdl_raw_options and ytdl_raw_options:match("proxy=([^ ]+)")) then
        return
    end

    print("starting mitmproxy...")
    -- launch mitm proxy
    local args = {
        os.getenv("HOME") .. "/venv/bin/mitmdump",
        "-s", mp.get_script_directory() .. "/mitmplugin.py",
        "--set", "web_open_browser=false",
        "--mode", "regular@12081", -- proxy port
    }
    mp.command_native_async({
            name = "subprocess",
            capture_stdout = true,
            capture_stderr = true,
            playback_only = true,
            args = args,
    });

    mp.set_property("http-proxy", "http://127.0.0.1:12081")
    mp.set_property("tls-verify", "no")
    -- this is not really needed
end

mp.register_event("start-file", init)

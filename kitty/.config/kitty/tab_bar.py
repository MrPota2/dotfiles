import os

NAMES = {
        "~/sh-vest/porter-flow/backend": "pfB",
        "~/sh-vest/porter-flow/frontend": "pfF",
        "~/sh-vest/porter-flow": "pf",
        "~/sh-vest/FlyttavleBE": "ftB",
        "~/sh-vest/FlyttavleFE": "ftF",
        "~/sh-vest/DipsArena.Sdk": "DSDK",
        "~/sh-vest/MicroserviceManager": "MICRO",
        "~/sh-vest/E2ETests": "E2E",
        }

_expanded = {os.path.expanduser(k): v for k, v in NAMES.items()}

def draw_title(data):
    tab = data["tab"]
    cwd = tab.active_wd or ""
    for path in sorted(_expanded, key=len, reverse=True):
        if cwd == path or cwd.startswith(path + os.sep):
            return _expanded[path]
    return os.path.basename(cwd) or data["title"]

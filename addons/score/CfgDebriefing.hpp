class CfgDebriefing {
    class GVAR(killersScoreReached) {
        title = CSTRING(Killers_Win);
        subtitle = CSTRING(Killers_Score_Reached);
        description = "";
        pictureBackground = "";
        picture = "";
        pictureColor[] = {0.0, 0.0, 0.0, 0.0};
    };
    class GVAR(killersDead): GVAR(killersScoreReached) {
        title = CSTRING(Police_Win);
        subtitle = CSTRING(Killers_Dead);
    };
    class GVAR(timeoutLimit): GVAR(killersDead) {
        subtitle = CSTRING(Timeout_Limit);
    };
};

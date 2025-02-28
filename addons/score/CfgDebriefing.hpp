class CfgDebriefing {
    class GVAR(emptyEnd) {
        title = "";
        subtitle = "";
        description = "";
        pictureBackground = "";
        picture = "";
        pictureColor[] = {0.0, 0.0, 0.0, 0.0};
    };
    class GVAR(killersScoreReached): GVAR(emptyEnd) {
        title = CSTRING(Killers_Win);
        subtitle = CSTRING(Killers_Score_Reached);
    };
    class GVAR(killersDead): GVAR(emptyEnd) {
        title = CSTRING(Police_Win);
        subtitle = CSTRING(Killers_Dead);
    };
    class GVAR(timeLimit): GVAR(killersDead) {
        subtitle = CSTRING(TimeLimit_Reached);
    };
    class GVAR(timeoutLimit): GVAR(killersDead) {
        subtitle = CSTRING(Timeout_Limit);
    };
    class GVAR(civiliansDead): GVAR(killersScoreReached) {
        subtitle = CSTRING(Civilians_Dead);
    };
};

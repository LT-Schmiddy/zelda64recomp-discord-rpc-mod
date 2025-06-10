#include "modding.h"
#include "global.h"
#include "recomputils.h"
#include "recompconfig.h"

#include "scene_table.h"

bool first_update = 1;
s16 last_scene_id = 0;
RECOMP_CALLBACK("*", recomp_on_init) void init_rpc() {
    
}


RECOMP_CALLBACK("*", recomp_on_play_init) void reset_rpc(PlayState* play) {
    first_update = 1;

}
RECOMP_CALLBACK("*", recomp_on_play_update) void update_rpc(PlayState* play) {
    if (play->sceneId != last_scene_id || first_update) {
        first_update = 0;
        recomp_printf("Scene Id: 0x%04X (%i): %s\n", play->sceneId, (s32)play->sceneId, rpcSceneInfo[play->sceneId - 3].display_name);
        last_scene_id = play->sceneId;
    }
}
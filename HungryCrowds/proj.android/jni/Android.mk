LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := game_shared

LOCAL_MODULE_FILENAME := libgame

LOCAL_SRC_FILES := hungrycrowdscpp/main.cpp \
                   ../../Classes/GameEngine/AppDelegate.cpp \
                   ../../Classes/Scenes/MainMenu/MainMenu.cpp \
                   ../../Classes/Scenes/StageSelect/StageSelectScene.cpp \
                   ../../Classes/Scenes/GameScene/StreetViewLayer.cpp \
                   ../../Classes/Scenes/GameScene/TableViewLayer.cpp \
                   ../../Classes/Scenes/GameScene/KitchenViewLayer.cpp \
                   ../../Classes/Managers/GameManager.cpp \
                   ../../Classes/Scenes/GameScene/GameScene.cpp \
                   ../../Classes/Scenes/GameScene/ControlLayer.cpp \
                   ../../Classes/Entities/Core/Actor.cpp \
                   ../../Classes/Entities/Core/GameObject.cpp \
                   ../../Classes/Entities/Core/Item.cpp \
                   ../../Classes/Entities/Actors/Client.cpp \
                   ../../Classes/Entities/Components/ComponentInterface.cpp \
                   ../../Classes/Entities/Components/FoodComponent.cpp \
                   ../../Classes/Utils/FoodFactory.cpp \
                   ../../Classes/Entities/Items/FoodContainer.cpp \
                   ../../Classes/Entities/Items/KitchenItem.cpp \
                   ../../Classes/Entities/Components/OrderComponent.cpp \
                   ../../Classes/Utils/tinyxml2.cpp \
                   ../../Classes/Utils/XMLLoader.cpp \
                   ../../Classes/Data/DataHolder.cpp \
                   ../../Classes/Data/ClientData.cpp \
                   ../../Classes/Data/LevelData.cpp \
                   ../../Classes/Data/FoodData.cpp \
                   ../../Classes/Data/StageData.cpp
                   
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../Classes                   

LOCAL_WHOLE_STATIC_LIBRARIES := cocos2dx_static cocosdenshion_static cocos_extension_static box2d_static
            
include $(BUILD_SHARED_LIBRARY)

$(call import-module,CocosDenshion/android) \
$(call import-module,cocos2dx) \
$(call import-module,extensions) $(call import-module,external/Box2D)

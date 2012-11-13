
_is_functions = _is_functions or {}
_to_functions = _to_functions or {}
_push_functions = _push_functions or {}

local CCObjectTypes = {
    "CCObject",
    "CCAction",
    "CCFiniteTimeAction",
    "CCActionInstant",
    "CCCallFunc",
    "CCCallFuncN",
    "CCFlipX",
    "CCFlipY",
    "CCHide",
    "CCPlace",
    "CCReuseGrid",
    "CCShow",
    "CCStopGrid",
    "CCToggleVisibility",
    "CCActionInterval",
    "CCAccelAmplitude",
    "CCAccelDeccelAmplitude",
    "CCActionCamera",
    "CCOrbitCamera",
	"CCCardinalSplineTo",
	"CCCardinalSplineBy",
	"CCCatmullRomTo",
	"CCCatmullRomBy",
    "CCActionEase",
    "CCEaseBackIn",
    "CCEaseBackInOut",
    "CCEaseBackOut",
    "CCEaseBounce",
    "CCEaseElastic",
    "CCEaseExponentialIn",
    "CCEaseExponentialInOut",
    "CCEaseExponentialOut",
    "CCEaseRateAction",
    "CCEaseSineIn",
    "CCEaseSineInOut",
    "CCEaseSineOut",
    "CCAnimate",
    "CCBezierBy",
    "CCBezierTo",
    "CCBlink",
    "CCDeccelAmplitude",
    "CCDelayTime",
    "CCFadeIn",
    "CCFadeOut",
    "CCFadeTo",
    "CCGridAction",
    "CCJumpBy",
    "CCJumpTo",
    "CCMoveTo",
    "CCMoveBy",
    "CCProgressFromTo",
    "CCProgressTo",
    "CCRepeat",
    "CCRepeatForever",
    "CCReverseTime",
    "CCRotateBy",
    "CCRotateTo",
    "CCScaleTo",
    "CCScaleBy",
    "CCSequence",
    "CCSkewTo",
    "CCSkewBy",
    "CCSpawn",
    "CCTintBy",
    "CCTintTo",
    "CCActionManager",
    "CCAnimation",
    "CCAnimationCache",
    "CCArray",
    "CCAsyncObject",
    "CCAutoreleasePool",
    "CCBMFontConfiguration",
    "CCCamera",
    "CCConfiguration",
    "CCData",
    "CCDirector",
    "CCDisplayLinkDirector",
    "CCEvent",
    "CCGrabber",
    "CCGrid3D",
    "CCTiledGrid3D",
    "CCKeypadDispatcher",
    "CCKeypadHandler",
    "CCDictionary",
    "CCNode",
    "CCAtlasNode",
    "CCLabelAtlas",
    "CCTileMapAtlas",
    "CCLayer",
    "CCLayerColor",
    "CCLayerGradient",
    "CCLayerMultiplex",
    "CCMenu",
    "CCMenuItem",
    "CCMenuItemLabel",
    "CCMenuItemAtlasFont",
    "CCMenuItemFont",
    "CCMenuItemSprite",
    "CCMenuItemImage",
    "CCMenuItemToggle",
    "CCMotionStreak",
    "CCParallaxNode",
    "CCParticleSystem",
    "CCParticleBatchNode",
    "CCParticleSystemQuad",
    "CCProgressTimer",
    "CCRenderTexture",
    "CCRibbon",
    "CCScene",
    "CCTransitionScene",
    "CCTransitionCrossFade",
    "CCTransitionFade",
    "CCTransitionFadeTR",
    "CCTransitionFadeBL",
    "CCTransitionFadeDown",
    "CCTransitionFadeUp",
    "CCTransitionJumpZoom",
    "CCTransitionMoveInL",
    "CCTransitionMoveInB",
    "CCTransitionMoveInR",
    "CCTransitionMoveInT",
    "CCTransitionPageTurn",
    "CCTransitionRadialCCW",
    "CCTransitionRadialCW",
    "CCTransitionRotoZoom",
    "CCTransitionSceneOriented",
    "CCTransitionFlipAngular",
    "CCTransitionFlipX",
    "CCTransitionFlipY",
    "CCTransitionZoomFlipAngular",
    "CCTransitionZoomFlipX",
    "CCTransitionZoomFlipY",
    "CCTransitionShrinkGrow",
    "CCTransitionSlideInL",
    "CCTransitionSlideInB",
    "CCTransitionSlideInR",
    "CCTransitionSlideInT",
    "CCTransitionSplitCols",
    "CCTransitionSplitRows",
    "CCTransitionTurnOffTiles",
	"CCTransitionProgress",
	"CCTransitionProgressRadialCCW",
	"CCTransitionProgressRadialCW",
	"CCTransitionProgressHorizontal",
	"CCTransitionProgressVertical",
	"CCTransitionProgressInOut",
	"CCTransitionProgressOutIn",
    "CCSprite",
    "CCLabelTTF",
    "CCTextFieldTTF",
    "CCSpriteBatchNode",
    "CCLabelBMFont",
    "CCTMXLayer",
    "CCTMXTiledMap",
    "CCPointObject",
    "CCProjectionProtocol",
    "CCRibbonSegment",
    "CCScheduler",
    "CCSet",
    "CCSpriteFrame",
    "CCSpriteFrameCache",
    "CCString",
    "CCTexture2D",
    "CCTextureAtlas",
    "CCTextureCache",
    "CCTexturePVR",
    "CCTimer",
    "CCTMXLayerInfo",
    "CCTMXMapInfo",
    "CCTMXObjectGroup",
    "CCTMXTilesetInfo",
    "CCTouch",
    "CCTouchDispatcher",
    "CCTouchHandler",
	"CCParticleFire",
	"CCParticleFireworks",
	"CCParticleSun",
	"CCParticleGalaxy",
	"CCParticleFlower",
	"CCParticleMeteor",
	"CCParticleSpiral",
	"CCParticleExplosion",
	"CCParticleSmoke",
	"CCParticleSnow",
	"CCParticleRain",
}

-- register CCObject types
for i = 1, #CCObjectTypes do
    _push_functions[CCObjectTypes[i]] = "tolua_pushusertype_ccobject"
end

-- register LUA_FUNCTION type
_to_functions["LUA_FUNCTION"] = "tolua_ref_function"
_is_functions["LUA_FUNCTION"] = "tolua_isfunction"


function get_property_methods_hook(ptype, name)
    if string.sub(ptype, 1, 2) == "CC" then
        ptype = string.sub(ptype, 3)
    end
    return "get"..ptype, "set"..ptype
end
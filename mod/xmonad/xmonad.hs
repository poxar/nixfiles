import XMonad
import XMonad.Config.Desktop
import XMonad.Util.EZConfig (additionalKeys)

myMod = mod4Mask
myTerm = "alacritty"

main = launch $ desktopConfig
    { terminal = myTerm
    , modMask  = myMod
    } `additionalKeys` myKeys

myKeys :: [((KeyMask, KeySym), X ())]
myKeys =
    [ ((myMod, xK_q), restart "xmonad" True)
    ]

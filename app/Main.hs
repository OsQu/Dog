module Main where

import UI.NCurses

main :: IO ()
main = runCurses $ do
    setEcho False
    w <- defaultWindow
    colorBrown <- newColorID ColorGreen ColorBlack 1
    updateWindow w $ do
        moveCursor 20 80
        drawString "The Dog"
        setColor colorBrown
        moveCursor 21 83
        drawString "d"
        moveCursor 0 0
    render
    waitFor w (\ev -> ev == EventCharacter 'q' || ev == EventCharacter 'Q')

waitFor :: Window -> (Event -> Bool) -> Curses ()
waitFor w p = loop where
    loop = do
        ev <- getEvent w Nothing
        case ev of
            Nothing -> loop
            Just ev' -> if p ev' then return () else loop

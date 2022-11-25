#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; emacs like key mapping
F12 & b::Left
F12 & n::Down
F12 & p::Up
F12 & f::Right
F12 & d::Del
F12 & h::BS
F12 & e::End
F12 & a::Home

; ctrl key mapping
F12 & l::^l
F12 & r::^r
F12 & g::^g
F12 & s::^s
F12 & t::^t
F12 & w::^w

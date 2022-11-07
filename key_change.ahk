#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; HHKB like key mapping
BS::\
\::BS

; emacs like key mapping
F13 & b::Left
F13 & n::Down
F13 & p::Up
F13 & f::Right
F13 & d::Del
F13 & h::BS
F13 & e::End
F13 & a::Home

; ctrl key mapping
F13 & l::^l
F13 & r::^r
F13 & g::^g
F13 & s::^s
F13 & t::^t
F13 & w::^w

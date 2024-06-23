SendMode "Input" ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir A_ScriptDir ; Ensures a consistent starting directory.

; Install keyboard and mouse hooks for debugging
InstallKeybdHook()
InstallMouseHook()

; emacs like key mapping
F12 & b::Send("{Left}")
F12 & n::Send("{Down}")
F12 & p::Send("{Up}")
F12 & f::Send("{Right}")
F12 & d::Send("{Del}")
F12 & h::Send("{BS}")
F12 & e::Send("{End}")
F12 & a::Send("{Home}")

; ctrl key mapping
F12 & l::Send("^l")
F12 & r::Send("^r")
F12 & g::Send("^g")
F12 & s::Send("^s")
F12 & t::Send("^t")
F12 & w::Send("^w")



source ~/pwndbg/gdbinit.py

set context-clear-screen on
set follow-fork-mode parent

source ~/splitmind/gdbinit.py
python
import splitmind
(splitmind.Mind()
  .tell_splitter(show_titles=True)
  .tell_splitter(set_title="Main")

  .right(display="backtrace", size="25%")

  .above(of="main", display="disasm", banner="top", size="85%")
  .right(of="disasm", display="legend")
  .below(of="legend", display="stack")

  .show("regs", on="legend")
  .below(of="backtrace", cmd='tty; tail -f /dev/null', clearing=False)
  .below(cmd="python3")
).build(nobanner=True)
end

set context-code-lines 30
set context-source-code-lines 30
set context-sections  "regs args code disasm stack backtrace"
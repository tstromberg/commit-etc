# 🔄 commit-etc: Your System Config Time Machine! 🔄

**commit-etc** is a magical little script that automatically backs up your system configuration files to a Git repository. It's like having a time machine for your `/etc` directory!

## Features ✨

- 🔄 **Automated Backups**: Set it and forget it with cron
- 🔍 **Change Tracking**: Track config changes with Git
- 🛡️ **Security-Conscious**: Excludes sensitive files
- 🌐 **Cross-Platform**: Works on virtually any UNIX-like system (Linux, macOS, FreeBSD, etc.)

## Quick Setup 🚀

```
1. git clone <your-repo-url> $HOME/commit-etc
2. cp commit-etc.sh $HOME/commit-etc
3. $HOME/commit-etc/commit-etc.sh
4. Add to crontab: 0 0 * * * $HOME/commit-etc/commit-etc.sh
```

## Why You'll Love It ❤️

- Track changes across multiple systems
- Experiment with configs without fear
- Bring your settings when distro-hopping
- Sync configurations between machines

---

_"Because your system configs deserve version control too!"_

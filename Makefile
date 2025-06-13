// FIXME: Resolver dependencias UNIX -> WINDOWS

PREFIX ?= /usr/local
EXEC_PREFIX ?= $(PREFIX)
BINDIR ?= $(EXEC_PREFIX)/bin
DATAROOTDIR ?= $(PREFIX)/share
DATADIR ?= $(DATAROOTDIR)
MANDIR ?= $(DATAROOTDIR)/man

# files that need mode 755
EXEC_FILES = git-standup

.PHONY: check all install uninstall shellcheck shfmt

all:
	@echo "usage: make install"
	@echo "       make uninstall"

install:
	mkdir -p $(BINDIR)
	install -m 0755 $(EXEC_FILES) $(BINDIR)

uninstall:
	test -d $(BINDIR) && \
	cd $(BINDIR) && \
	rm -f $(EXEC_FILES)

check: shellcheck shfmt

shellcheck:
	./actions/shellcheck

shfmt:
	./actions/shfmt
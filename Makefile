
# files

EXE = scan

OBJS = bb_base.o bb_comp.o bb_index.o bit.o book.o common.o eval.o \
       fen.o game.o gen.o hash.o hub.o libmy.o list.o main.o move.o pos.o \
       score.o search.o sort.o thread.o tt.o util.o var.o

# rules

all: $(EXE)

clean:
	$(RM) $(OBJS) .depend # keep exe

# general

CXX      = clang++-8  # or g++
CXXFLAGS = -pthread
LDFLAGS  = -pthread

# warnings

CXXFLAGS += -ansi -pedantic -Wall -Wextra
CXXFLAGS += -Wno-unused -Wno-unused-parameter

# C++

CXXFLAGS += -std=c++14 -fno-rtti

# optimisation

CXXFLAGS += -O2 -mpopcnt
LDFLAGS  += -O2

CXXFLAGS += -flto
LDFLAGS  += -flto

# debug

CXXFLAGS += -DNDEBUG

# dependencies

$(EXE): $(OBJS)
	$(CXX) $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

.depend:
	$(CXX) $(CXXFLAGS) -MM $(OBJS:.o=.cpp) > $@

include .depend


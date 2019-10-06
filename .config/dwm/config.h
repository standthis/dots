/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 0;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "Source Code Pro:size=10", };
static const char dmenufont[]       = "Source Code Pro:size=10";
static const char normbordercolor[] = "#282828"; // #282828
static const char normbgcolor[]     = "#282828";
static const char normfgcolor[]     = "#f9f5d7";
static const char selbordercolor[]  = "#076678";
static const char selbgcolor[]      = "#32302f";
static const char selfgcolor[]      = "#f9f5d7";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { normfgcolor, normbgcolor, normbordercolor },
	[SchemeSel] =  { selbordercolor,  normbgcolor,  selbgcolor },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            0,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 0,       0,           -1 },
	{ "alacritty",  NULL,       NULL,     1 << 1,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selfgcolor, "-sf", selbordercolor, NULL };
static const char *mpdmenu_library[]  = { "mpdmenu", "-l", "::", "-i", "-l", "20", "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selfgcolor, "-sf", selbordercolor, NULL };
static const char *mpdmenu_playlist[] = { "mpdmenu", "-p", "::", "-i", "-l", "20", "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selfgcolor, "-sf", selbordercolor, NULL };
static const char *mpdmenu_addplaylist[]  = { "mpdmenu", "-a", "::", "-i", "-l", "20", "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selfgcolor, "-sf", selbordercolor, NULL };
static const char *clipmenu[] = { "clipmenu", "-i", "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selfgcolor, "-sf", selbordercolor, NULL };
static const char *passmenu[] = { "passmenu", "-i", "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selfgcolor, "-sf", selbordercolor, NULL };
static const char *termcmd[]  = { "st", NULL };
static const char *slock[]  = { "slock", NULL };
//static const char *urxvt[]  = { "urxvt", NULL };
static const char *stmux[]  = { "st", "-e", "tmux", NULL };
static const char *alacritty[]  = { "alacritty", NULL };
static const char *termite[]  = { "termite", NULL };
static const char *signaldesktop[]  = { "signal-desktop", NULL };
static const char *soulseek[]  = { "soulseekqt", NULL };
static const char *browser[]  = { "firefox", NULL };
static const char *browserp[]  = { "firefox", "-private-window", NULL };
static const char *chromium[]  = { "chromium", NULL };
static const char *volup[]  = { "amixer", "-q", "-M", "set", "Master", "2%+", "unmute", NULL };
static const char *voldown[]  = { "amixer", "-q", "-M", "set", "Master", "2%-", "unmute", NULL };
static const char *volzero[]  = { "amixer", "-M", "sset", "Master", "0%", NULL };
static const char *mpdtoggle[]  = { "mpc", "-q", "toggle", NULL };
static const char *mpdstop[]  = { "mpc", "-q", "stop", NULL };
static const char *mpdnext[]  = { "mpc", "-q", "next", NULL };
static const char *mpdprev[]  = { "mpc", "-q", "prev", NULL };

static Key keys[] = {
	/* modifier                     key            function        argument */
	{ MODKEY,                       XK_p,          spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_a,          spawn,          {.v = alacritty } },
	{ MODKEY|ShiftMask,             XK_a,          spawn,          {.v = termite } },
	{ MODKEY,                       XK_Return,     spawn,          {.v = termcmd } },
	{ MODKEY|ControlMask,           XK_Return,     spawn,          {.v = stmux } },
    { MODKEY,                       XK_backslash,  spawn,          {.v = browser } },
    { MODKEY|ShiftMask,             XK_backslash,  spawn,          {.v = chromium } },
    { MODKEY|ControlMask,           XK_backslash,  spawn,          {.v = browserp } },
//	{ MODKEY|ShiftMask,             XK_z,          spawn,          {.v = slock } },
	{ MODKEY,                       XK_Delete,     spawn,          {.v = slock } },
	{ MODKEY,                       XK_Insert,     spawn,          {.v = signaldesktop } },
	{ MODKEY|ShiftMask,             XK_Insert,     spawn,          {.v = soulseek } },
	{ MODKEY|ShiftMask,             XK_comma,      spawn,          {.v = mpdprev } },
	{ MODKEY|ShiftMask,             XK_period,     spawn,          {.v = mpdnext } },
	{ MODKEY|ShiftMask,             XK_minus,      spawn,          {.v = volzero } },
	{ MODKEY|ShiftMask,             XK_equal,      spawn,          {.v = mpdtoggle } },
	{ MODKEY|ControlMask,           XK_equal,      spawn,          {.v = mpdstop } },
	{ MODKEY,                       XK_minus,      spawn,          {.v = voldown } },
	{ MODKEY,                       XK_equal,      spawn,          {.v = volup } },
	{ MODKEY,                       XK_slash,      spawn,          {.v = mpdmenu_library } },
	{ MODKEY|ControlMask,           XK_slash,      spawn,          {.v = mpdmenu_playlist } },
	{ MODKEY|ShiftMask,             XK_slash,      spawn,          {.v = mpdmenu_addplaylist } },
	{ MODKEY,                       XK_bracketright,      spawn,   {.v = clipmenu } },
	{ MODKEY|ControlMask,           XK_bracketright,      spawn,   {.v = passmenu } },
	{ MODKEY,                       XK_b,          togglebar,      {0} },
	{ MODKEY,                       XK_j,          focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,          focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,          incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,          incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,          setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,          setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_Return,     zoom,           {0} },
	{ MODKEY,                       XK_Tab,        view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,          killclient,     {0} },
	{ MODKEY,                       XK_t,          setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,          setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,          setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,      setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,      togglefloating, {0} },
	{ MODKEY,                       XK_0,          view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,          tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,      focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period,     focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,      tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period,     tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                          0)
	TAGKEYS(                        XK_2,                          1)
	TAGKEYS(                        XK_3,                          2)
	TAGKEYS(                        XK_4,                          3)
	TAGKEYS(                        XK_5,                          4)
	TAGKEYS(                        XK_6,                          5)
	TAGKEYS(                        XK_7,                          6)
	TAGKEYS(                        XK_8,                          7)
	TAGKEYS(                        XK_9,                          8)
	{ MODKEY|ShiftMask,             XK_q,          quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};


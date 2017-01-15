#ifndef ___DROID4X_LOG__H__
#define ___DROID4X_LOG__H__

#include <stdio.h>
#include <stdarg.h>

typedef enum {
	LOG_FATAL = 0,
	LOG_ERROR,
	LOG_WARING,
	LOG_INFO,
	LOG_NOISE,
} log_level;


class Log
{
	FILE				*m_file;
	log_level			m_maxlevel;
	bool				m_detail;
public:
	bool init(const char* path, log_level max_level, bool clr, bool pref_detail);
	void set_level(log_level max_level);
	void write_line(log_level level, const char* file, int line, const char* func, bool endline, char* format, ...);
};


extern Log _mylog;

#define __FILE_PURE_NAME__ (strrchr(__FILE__, '\\') ? strrchr(__FILE__, '\\') + 1 : __FILE__)




void LOG_NOEND(char* format, ...);

#define LOG_INIT(path, level, clr, detail) (_mylog.init(path, level, clr, detail))
#define LOG_LEVEL(level) (_mylog.set_level(level))
#define DPRINT(level, format, ...) (_mylog.write_line(level, __FILE_PURE_NAME__, __LINE__, __FUNCTION__, true, format, ## __VA_ARGS__))
#define DPRINT_NOEND(level, format, ...) (_mylog.write_line(level, __FILE_PURE_NAME__, __LINE__, __FUNCTION__, false, format, ## __VA_ARGS__))

#define LOG_F(format, ...) (_mylog.write_line(LOG_FATAL, __FILE_PURE_NAME__, __LINE__, __FUNCTION__, true, format, ## __VA_ARGS__))
#define LOG_E(format, ...) (_mylog.write_line(LOG_ERROR, __FILE_PURE_NAME__, __LINE__, __FUNCTION__, true, format, ## __VA_ARGS__))
#define LOG_W(format, ...) (_mylog.write_line(LOG_WARING, __FILE_PURE_NAME__, __LINE__, __FUNCTION__, true, format, ## __VA_ARGS__))
#define LOG(format, ...) (_mylog.write_line(LOG_INFO, __FILE_PURE_NAME__, __LINE__, __FUNCTION__, true, format, ## __VA_ARGS__))
#define LOG_N(format, ...) (_mylog.write_line(LOG_NOISE, __FILE_PURE_NAME__, __LINE__, __FUNCTION__, true, format, ## __VA_ARGS__))


#endif

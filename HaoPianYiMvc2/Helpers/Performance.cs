using System;
using System.Runtime.InteropServices;


namespace HaoPianYiMvc2.Helpers
{
    public static class Performance
    {
        [DllImport("kernel32.dll")]
        static extern bool QueryPerformanceCounter([In, Out] ref long lpPerformanceCount);
        [DllImport("kernel32.dll")]
        static extern bool QueryPerformanceFrequency([In,Out] ref long lpFrequency);

        static long _f = 0;
        static public long GetTickCount()
        {
            long f = _f;
            if (f == 0)
            {
                if (QueryPerformanceFrequency(ref f))
                {
                    _f = f;
                }
                else
                {
                    _f = -1;
                }
            }

            if (f == -1)
            {
                return Environment.TickCount * 10000;
            }
            long c = 0;
            QueryPerformanceCounter(ref c);
            return (long)(((double)c) * 1000 * 10000 / ((double)f));
        }

        //GetTickCount()为0时的DateTime.Ticks值
        static long _tc = 0;
        //这个返回的不是真正的精确时间，但时间与时间的差是精确的。 
        //GetExactNow与DateTime.Now的偏差比DateTime.Now的精度还要小，所以该偏差 
        static public DateTime GetExactNow()
        {
            if (_tc == 0)
            {
                long tc = GetTickCount();
                DateTime dt = DateTime.Now;
                _tc = dt.Ticks - tc;
                return dt;
            }

            return new DateTime(_tc + GetTickCount());
        } 


    }
}
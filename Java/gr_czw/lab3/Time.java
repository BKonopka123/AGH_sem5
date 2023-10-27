public class Time{
    
    int day;
    int hour;
    int minute;
    int second;

    public static final int SECONDS_PER_MINUTE = 60;
    public static final int MINUTES_PER_HOUR = 60;
    public static final int HOURS_PER_DAY = 24;

    public static final Time ZERO = new Time(0, 0, 0, 0);
    public static final Time ONE_SECOND = new Time(0, 0, 0, 1);
    public static final Time ONE_MINUTE = new Time(0, 0, 1, 0);
    public static final Time ONE_HOUR = new Time(0, 1, 0, 0);
    public static final Time ONE_DAY = new Time(1, 0, 0, 0);
    public static final Time ONE_YEAR = new Time(365, 0, 0, 0);

    public Time(){
        this.day = 0;
        this.hour = 0;
        this.minute = 0;
        this.second = 0;
    }

    public Time(int day, int hour, int minute, int second){
        setDays(day);
        setHours(hour);
        setMinutes(minute);
        setSeconds(second);
    }

    public void setDays(int day){
        if(checkDays(day))
            this.day = day;
    }

    private boolean checkDays(int day){
        if(day < 0){
            System.out.println("Liczba dni: " + day + " spoza przedzialu [0, 2147483647)!");
            return false;
        }
        else
            return true;
    }

    public void setHours(int hour){
        if(checkHours(hour))
            this.hour = hour;
    }

    private boolean checkHours(int hour){
        if(hour < 0 || hour > 23){
            System.out.println("Liczba godzin: " + hour + " spoza przedzialu [0, 24)!");
            return false;
        }
        else
            return true;
    }

    public void setMinutes(int minute){
        if(checkMinutes(minute))
            this.minute = minute;
    }

    private boolean checkMinutes(int minute){
        if(minute < 0 || minute > 59){
            System.out.println("Liczba minut: " + minute + " spoza przedzialu [0, 60)!");
            return false;
        }
        else
            return true;
    }

    public void setSeconds(int second){
        if(checkSeconds(second))
            this.second = second;
    }

    private boolean checkSeconds(int second){
        if(second < 0 || second > 59){
            System.out.println("Liczba sekund: " + second + " spoza przedzialu [0, 60)!");
            return false;
        }
        else
            return true;
    }

    public int getDays(){
        return this.day;
    }

    public int getHours(){
        return this.hour;
    }

    public int getMinutes(){
        return this.minute;
    }

    public int getSeconds(){
        return this.second;
    }

    public String toString(){
        return this.day + ":" + this.hour + ":" + this.minute + ":" + this.second;
    }

    public static Time timeOf(String time){
        String[] timeArray = time.split(":");
        int day = Integer.parseInt(timeArray[0]);
        int hour = Integer.parseInt(timeArray[1]);
        int minute = Integer.parseInt(timeArray[2]);
        int second = Integer.parseInt(timeArray[3]);
        return new Time(day, hour, minute, second);
    }
    
    public static Time copyOf(Time time){
        return new Time(time.day, time.hour, time.minute, time.second);
    }

    public void addDays(int day){
        if(day > 0){
            if(this.day + day >= 365)
                System.out.println("Za duzo dni!!!!");
            else
                this.day += day;
        }
    }

    public void addHours(int hour){
        if(hour > 0){
            this.hour += hour;
            if(this.hour >=24){
                addDays(this.hour/24);
                this.hour = this.hour % 24;
            }
        }
    }

    public void addMinutes(int minute){
        if(minute > 0){
            this.minute += minute;
            if(this.minute >=60){
                addHours(this.minute/60);
                this.minute = this.minute % 60;
            }
        }
    }

    public void addSeconds(int second){
        if(second > 0){
            this.second += second;
            if(this.second >=60){
                addMinutes(this.second/60);
                this.second = this.second % 60;
            }
        }
    }

    public static Time plusTime(Time time1, Time time2){
        Time time = new Time();
        time.addDays(time1.day + time2.day);
        time.addHours(time1.hour + time2.hour);
        time.addMinutes(time1.minute + time2.minute);
        time.addSeconds(time1.second + time2.second);
        return time;
    }

    public static Time times(Time time, int multiplier){
        Time newTime = new Time();
        newTime.addDays(time.day * multiplier);
        newTime.addHours(time.hour * multiplier);
        newTime.addMinutes(time.minute * multiplier);
        newTime.addSeconds(time.second * multiplier);
        return newTime;
    }

    public boolean equals(Time time){
        if(time == null)
            return false;
        if(this.day != time.day)
            return false;
        if(this.hour != time.hour)
            return false;
        if(this.minute != time.minute)
            return false;
        if(this.second != time.second)
            return false;
        return true;
    }
}
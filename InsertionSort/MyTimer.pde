public class SimpleTimer {
    private long startTime;
    private long endTime;

    public SimpleTimer(){
        startTime = 0;
        endTime = 0;
    }

    public void start(){
        startTime = System.nanoTime();
        endTime = 0;
    }

    public double stop(){
        endTime = System.nanoTime();
        double seconds = (double) (endTime - startTime) / 1000000000;
        endTime = 0;
        return seconds;
    }

    public double getElapsedSec(){
        endTime = System.nanoTime();
        return (double) (endTime - startTime) / 1000000000;
    }

    public double getElapsedMin(){
        endTime = System.nanoTime();
        return (double)(endTime - startTime) / 60000000000L;
    }
}

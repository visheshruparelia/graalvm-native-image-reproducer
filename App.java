public class App {
    public static void main(String[] args) {
        System.out.println("Starting native image demo...");
        while (true) {
            doWork();
            try {
                Thread.sleep(10);
            } catch (InterruptedException e) {
                break;
            }
        }
    }

    private static void doWork() {
        computeIntensive();
        allocateMemory();
    }

    private static void computeIntensive() {
        double result = 0;
        for (int i = 0; i < 10000; i++) {
            result += Math.sin(i) * Math.cos(i);
        }
    }

    private static void allocateMemory() {
        String[] data = new String[100];
        for (int i = 0; i < data.length; i++) {
            data[i] = "data-" + i;
        }
    }
}
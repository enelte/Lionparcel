import java.util.Arrays;
import java.util.Comparator;
import java.util.Scanner;

public class OddEven {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int[] inputArray = {3, 2, 5, 1, 8, 9, 6};
        int[] sortedArray = sortEvenOdd(inputArray);
        System.out.println(Arrays.toString(sortedArray));
    }

    public static int[] sortEvenOdd(int[] input) {
        // Separate even and odd numbers
        int[] evenArray = Arrays.stream(input)
                .filter(num -> num % 2 == 0)
                .boxed()
                .sorted(Comparator.reverseOrder())
                .mapToInt(Integer::intValue)
                .toArray();

        int[] oddArray = Arrays.stream(input)
                .filter(num -> num % 2 != 0)
                .boxed()
                .sorted(Comparator.reverseOrder())
                .mapToInt(Integer::intValue)
                .toArray();

        // Concatenate even and odd arrays
        int[] resultArray = new int[evenArray.length + oddArray.length];
        System.arraycopy(evenArray, 0, resultArray, 0, evenArray.length);
        System.arraycopy(oddArray, 0, resultArray, evenArray.length, oddArray.length);

        return resultArray;
    }
}

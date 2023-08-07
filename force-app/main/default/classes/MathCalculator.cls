public class MathCalculator {
private static Integer add(Integer a, Integer b){
return a+b;
}
private static Integer multiply(Integer a, Integer b){
return a*b;
}

private static Integer subtract(Integer a, Integer b){
return a-b;
}

private static void printOutput(Integer a, Integer b){
System.debug('Summation of 2 values:' + add(a,b));
System.debug('Multiplication of 2 values:' + multiply(a,b));
System.debug('Substraction of 2 values:' + subtract(a,b));
}
public void doMath(Integer a, Integer b){
printOutput(a, b);
}

}
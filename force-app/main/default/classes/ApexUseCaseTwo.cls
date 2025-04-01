public with sharing class ApexUseCaseTwo {
  public static Decimal calculateInterest(
    Decimal principal,
    Decimal interest,
    Integer timeInYears
  ) {
    if (principal != null && interest != null && timeInYears != null) {
      Decimal simpleInterest = (principal * interest * timeInYears) / 100;
      return simpleInterest;
    }
    return 0;
  }
}
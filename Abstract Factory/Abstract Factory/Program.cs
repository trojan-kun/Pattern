interface MeatFactory
{
	IAnimals WorkProcess();
}
class CowFactory : MeatFactory
{
	public IAnimals WorkProcess() => new Cow();
}
class PigFactory : MeatFactory
{
	public IAnimals WorkProcess() => new Pig();
}

interface IAnimals
{
	public void SendToThePlant();
	public void ProduceGroundMeat();
	public void ProduceSteak();

}
class Cow: IAnimals
{
	public void SendToThePlant() => Console.WriteLine("Коровка на фабрике, из нее");
	public void ProduceGroundMeat() => Console.WriteLine("  произведен фарш");
	public void ProduceSteak() => Console.WriteLine("  произведен стейк");
}
class Pig : IAnimals
{
	public void SendToThePlant() => Console.WriteLine("Свинка на фабрике, из нее");
	public void ProduceGroundMeat() => Console.WriteLine("  произведен фарш");
	public void ProduceSteak() => Console.WriteLine("  произведен стейк");
}

class Program
{
	static void Main()
	{
		MeatFactory FactoryCow = new CowFactory();
		IAnimals CowOne = FactoryCow.WorkProcess();
		CowOne.SendToThePlant();
		CowOne.ProduceGroundMeat();

		MeatFactory FactoryPig = new PigFactory();
		IAnimals PigOne = FactoryPig.WorkProcess();
		PigOne.SendToThePlant();
		PigOne.ProduceSteak();
	}
}
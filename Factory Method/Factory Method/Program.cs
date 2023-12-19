interface IServiceSubscription
{
	public void GetInfo();
}

public class FreeSubscription : IServiceSubscription
{
	public void GetInfo()
	{
		Console.WriteLine("Цена: 0 монет.");
		Console.WriteLine("Преимущества: Слежение за новостями и обновлениями, доступ к БЕСПЛАТНОМУ контенту.");
	}
}
public class MediumSubscription : IServiceSubscription
{
	public void GetInfo()
	{
		Console.WriteLine("Цена: 150 монет.");
		Console.WriteLine("Преимущества: Предыдущие + ЭКСКЛЮЗИВНЫЙ контен");
	}
}
public class ProSubscription : IServiceSubscription
{
	public void GetInfo()
	{
		Console.WriteLine("Цена: 300 монет.");
		Console.WriteLine("Преимущества: предыдущие + Эксклюзивная кастомизация и САМЫЙ СКРЫТЫЙ контент");
	}
}

static class Service
{
	public static IServiceSubscription Build(int Action)
	{
		switch (Action)
		{
			case 1:				
				return new FreeSubscription();
			case 2:
				return new MediumSubscription();
			case 3:
				return new ProSubscription();
			default: return new FreeSubscription();
		}
	}
}

class Program
{
	static void Main()
	{
		Console.WriteLine("Выберете Подписку");
		Console.WriteLine("1. FreeSubscription");
		Console.WriteLine("2. MediumSubscription");
		Console.WriteLine("3. ProSubscription");

		int Action = Convert.ToInt32(Console.ReadLine());
		var Sub = Service.Build(Action);
		Sub.GetInfo();
	}
}
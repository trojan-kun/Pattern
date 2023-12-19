class Program
{
	static void Main()
	{
		Singleton singleton1 = Singleton.Instance;
		Singleton singleton2 = Singleton.Instance;

		Console.WriteLine(singleton1 == singleton2);

		new Thread(() =>
		{
			Singleton singleton3 = Singleton.Instance;
			Console.WriteLine(singleton1 == singleton3);

		}).Start();
	}
}

class Singleton
{
	private static Singleton _instance = null;
	private static object Root = new Object();

	private Singleton() { }

	public static Singleton Instance
	{
		get
		{		
			lock (Root)
			{
				if (_instance == null)
					_instance = new Singleton();
			}
			return _instance;
		}
	}
}
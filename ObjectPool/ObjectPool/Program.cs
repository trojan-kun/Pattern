class Program
{
	static void Main()
	{
		ObjectPool<Barbell> BarbellPool = ObjectPool<Barbell>.GetInstance();
		Console.WriteLine("спортзал начал работу.");

		bool _cycle = true;
		int Choice;
		const int MaxSize = 5;

		for(int i=0; i < MaxSize; i++)
		{
			Barbell barbell = new Barbell();
			BarbellPool.CreatePool(barbell);
		}

		while (_cycle)
		{
			Console.WriteLine("-----");
			Console.WriteLine("1) Взять штангу");
			Console.WriteLine("2) Положить штангу");
			Console.WriteLine("3) Выйти");
			Console.WriteLine("-----");
			Choice = Convert.ToInt32(Console.ReadLine());

			switch(Choice )
			{
				case 1:
					BarbellPool.GetObject(); break;
				case 2:				
					BarbellPool.ReleaseObject(MaxSize); 
					break;
				case 3:
					_cycle= false; break;
			}
		}
	}
}

class ObjectPool<T> where T : new()
{
	private static List<T> _freeBarbell = new List<T>();
	private List<T> _inUse = new List<T>();
	private int _counter = 0;

	private static ObjectPool<T> instance = null;

	public static ObjectPool<T> GetInstance()
	{
		if (instance == null)
			instance = new ObjectPool<T>();
		return instance;
	}

	public T GetObject()
	{
		if (_freeBarbell.Count > 0)
		{
			T Object = _freeBarbell[0];
			_inUse.Add(Object);
			_freeBarbell.RemoveAt(0);
			_counter--;
			Console.WriteLine($"Клиент взял штангу, остальсь {_counter} штук.");
			return Object;
		}
		else
			throw new InvalidOperationException("Нет, свободных эллементов!");
	}
	public void ReleaseObject(int MaxSize)
	{ 
		if (_counter < MaxSize)
		{
			T Object = _inUse[0];
			_freeBarbell.Add(Object);
			_inUse.Remove(Object);
			_counter++;
			Console.WriteLine($"Количество штанг на месте: {_counter} штук.");
		}
		else
			Console.WriteLine("Все штанги на месте.");
	}

	public void CreatePool(T Object)
	{
		_freeBarbell.Add(Object);
		_counter++;
	}
}

class Barbell
{
	private int _weight;
}

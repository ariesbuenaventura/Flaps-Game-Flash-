package
{	
	public class cFlaps
	{
		public const   MAX_CARD 	= 103;
		// Frame # for back image
		private const BACK_FRAME_ID = 63; 
		
		public var Stock		   : Array = new Array();
		public var Waste		   : Array = new Array();
		public var Player		   : Array = new Array();				
		
		private var selFlapsCardId : Number;
		private var	selCardType    : String;
		private var	selCardCode    : String;
		private var whichCardId	   : Number;
		private var cardOwner      : Number;
		private var cardIndex	   : Number;
		private var nPlayers 	   : Number;
		private var TotalCards	   : Number;
		private var whosPlayer     : Number;
		private var Card		   : Array = new Array(MAX_CARD);
		private var TempCard       : Array = new Array(MAX_CARD);
    	private var ExtraCard      : Array = new Array(7);
		private var AceCard        : Array = new Array();
		private var whichSuit	   : String;
		private var isDebug        : Boolean = true;
		
		function InitializeCards()
		{
			// Clubs
			Card[0]   = new cCard(1,  1,  "ACE", "C",  "A", "", 1);
			Card[1]   = new cCard(2,  2,    "2", "C",  "2", "", 2);
			Card[2]   = new cCard(3,  2,    "2", "C",  "2", "", 2);	
			Card[3]   = new cCard(4,  3,    "3", "C",  "3", "", 3);
			Card[4]   = new cCard(5,  3,    "3", "C",  "3", "", 3);	
			Card[5]   = new cCard(6,  4,  "FLP", "C",  "4", "", 4);	
			Card[6]   = new cCard(7,  4,  "FLP", "C",  "4", "", 4);		
			Card[7]   = new cCard(8,  4,  "FLP", "C",  "4", "", 4);	
			Card[8]   = new cCard(9,  4,  "FLP", "C",  "4", "", 4);		
			Card[9]   = new cCard(10,  5,   "5", "C",  "5", "", 5);	
			Card[10]  = new cCard(11, 5,    "5", "C",  "5", "", 5);	
			Card[11]  = new cCard(12, 6,    "7", "C",  "7", "", 7);	
			Card[12]  = new cCard(13, 6,    "7", "C",  "7", "", 7);		
			Card[13]  = new cCard(14, 7,    "8", "C",  "8", "", 8);	
			Card[14]  = new cCard(15, 7,    "8", "C",  "8", "", 8);		
			Card[15]  = new cCard(16, 8,    "9", "C",  "9", "", 9);	
			Card[16]  = new cCard(17, 8,    "9", "C",  "9", "", 9);	
			Card[17]  = new cCard(18, 9,   "10", "C", "10", "", 10);	
			Card[18]  = new cCard(19, 9,   "10", "C", "10", "", 10);	
			Card[19]  = new cCard(20, 10,   "J", "C",  "J", "", 11);	
			Card[20]  = new cCard(21, 11,   "J", "C", "UJ", "UP-JACKS", 11);		
			Card[21]  = new cCard(22, 12,   "Q", "C",  "Q", "", 12);		
			Card[22]  = new cCard(23, 13,   "Q", "C", "HD", "HOOFERS-DOOPERS", 12);		
			Card[23]  = new cCard(24, 14,   "K", "C",  "K", "", 13);			
			Card[24]  = new cCard(25, 15, "ACE", "C", "AL", "Ace 'N' Lay", 1);				
		
			// Spades
			Card[25]  = new cCard(26, 16, "ACE", "S",  "A", "", 1);
			Card[26]  = new cCard(27, 17,   "2", "S",  "2", "", 2);
			Card[27]  = new cCard(28, 17,   "2", "S",  "2", "", 2);
			Card[28]  = new cCard(29, 18,   "3", "S",  "3", "", 3);	
			Card[29]  = new cCard(30, 18,   "3", "S",  "3", "", 3);	
			Card[30]  = new cCard(31, 19, "FLP", "S",  "4", "", 4);	
			Card[31]  = new cCard(32, 19, "FLP", "S",  "4", "", 4);	
			Card[32]  = new cCard(33, 19, "FLP", "S",  "4", "", 4);	
			Card[33]  = new cCard(34, 19, "FLP", "S",  "4", "", 4);	
			Card[34]  = new cCard(35, 20,   "5", "S",  "5", "", 5);	
			Card[35]  = new cCard(36, 20,   "5", "S",  "5", "", 5);	
			Card[36]  = new cCard(37, 21,   "7", "S",  "7", "", 7);
			Card[37]  = new cCard(38, 21,   "7", "S",  "7", "", 7);
			Card[38]  = new cCard(39, 22,   "8", "S",  "8", "", 8);	
			Card[39]  = new cCard(40, 22,   "8", "S",  "8", "", 8);	
			Card[40]  = new cCard(41, 23,   "9", "S",  "9", "", 9);	
			Card[41]  = new cCard(42, 23,   "9", "S",  "9", "", 9);	
			Card[42]  = new cCard(43, 24,  "10", "S", "10", "", 10);	
			Card[43]  = new cCard(44, 24,  "10", "S", "10", "", 10);	
			Card[44]  = new cCard(45, 25,   "J", "S",  "J", "", 11);	
			Card[45]  = new cCard(46, 26,   "J", "S", "UJ", "UP-JACKS", 11);		
			Card[46]  = new cCard(47, 27,   "Q", "S",  "Q", "", 12);		
			Card[47]  = new cCard(48, 28,   "Q", "S", "HD", "HOOFERS-DOOPERS", 12);		
			Card[48]  = new cCard(49, 29,   "K", "S",  "K", "", 13);			
			Card[49]  = new cCard(50, 30, "ACE", "S", "AL", "Ace 'N' Lay", 1);					
			Card[50]  = new cCard(51, 31, "ACE", "S", "AE", "Ace 'N' End", 1);				
		
			// Heart
			Card[51]  = new cCard(52, 32, "ACE", "H",  "A", "", 1);	
			Card[52]  = new cCard(53, 33,   "2", "H",  "2", "", 2);
			Card[53]  = new cCard(54, 33,   "2", "H",  "2", "", 2);
			Card[54]  = new cCard(55, 34,   "3", "H",  "3", "", 3);	
			Card[55]  = new cCard(56, 34,   "3", "H",  "3", "", 3);	
			Card[56]  = new cCard(57, 35, "FLP", "H",  "4", "", 4);	
			Card[57]  = new cCard(58, 35, "FLP", "H",  "4", "", 4);	
			Card[58]  = new cCard(59, 35, "FLP", "H",  "4", "", 4);	
			Card[59]  = new cCard(60, 35, "FLP", "H",  "4", "", 4);	
			Card[60]  = new cCard(61, 36,   "5", "H",  "5", "", 5);	
			Card[61]  = new cCard(62, 36,   "5", "H",  "5", "", 5);	
			Card[62]  = new cCard(63, 37,   "7", "H",  "7", "", 7);
			Card[63]  = new cCard(64, 37,   "7", "H",  "7", "", 7);
			Card[64]  = new cCard(65, 38,   "8", "H",  "8", "", 8);	
			Card[65]  = new cCard(66, 38,   "8", "H",  "8", "", 8);	
			Card[66]  = new cCard(67, 39,   "9", "H",  "9", "", 9);	
			Card[67]  = new cCard(68, 39,   "9", "H",  "9", "", 9);	
			Card[68]  = new cCard(69, 40,  "10", "H", "10", "", 10);	
			Card[69]  = new cCard(70, 40,  "10", "H", "10", "", 10);	
			Card[70]  = new cCard(71, 41,   "J", "H",  "J", "", 11);	
			Card[71]  = new cCard(72, 42,   "Q", "H",  "Q", "", 12);		
			Card[72]  = new cCard(73, 43,   "Q", "H", "HD", "HOOFERS-DOOPERS", 12);		
			Card[73]  = new cCard(74, 44,   "K", "H",  "K", "", 13);			
			Card[74]  = new cCard(75, 45, "ACE", "H", "AL", "Ace 'N' Lay", 1);					
			Card[75]  = new cCard(76, 46, "FLP", "H", "MF", "Mega Flap", 1);				
		
			// Diamond
			Card[76]  = new cCard(77, 47,   "2", "D",  "2", "", 2);
			Card[77]  = new cCard(78, 47,   "2", "D",  "2", "", 2);
			Card[78]  = new cCard(79, 48,   "3", "D",  "3", "", 3);	
			Card[79]  = new cCard(80, 48,   "3", "D",  "3", "", 3);	
			Card[80]  = new cCard(81, 49, "FLP", "D",  "4", "", 4);	
			Card[81]  = new cCard(82, 49, "FLP", "D",  "4", "", 4);	
			Card[82]  = new cCard(83, 49, "FLP", "D",  "4", "", 4);	
			Card[83]  = new cCard(84, 49, "FLP", "D",  "4", "", 4);	
			Card[84]  = new cCard(85, 50,   "5", "D",  "5", "", 5);	
			Card[85]  = new cCard(86, 50,   "5", "D",  "5", "", 5);	
			Card[86]  = new cCard(87, 51,   "7", "D",  "7", "", 7);
			Card[87]  = new cCard(88, 51,   "7", "D",  "7", "", 7);
			Card[88]  = new cCard(89, 52,   "8", "D",  "8", "", 8);	
			Card[89]  = new cCard(90, 52,   "8", "D",  "8", "", 8);	
			Card[90]  = new cCard(91, 53,   "9", "D",  "9", "", 9);	
			Card[91]  = new cCard(92, 53,   "9", "D",  "9", "", 9);	
			Card[92]  = new cCard(93, 54,  "10", "D", "10", "", 10);	
			Card[93]  = new cCard(94, 54,  "10", "D", "10", "", 10);	
			Card[94]  = new cCard(95, 55,   "J", "D",  "J", "", 11);	
			Card[95]  = new cCard(96, 56,   "J", "D", "UJ", "UP-JACKS", 11);		
			Card[96]  = new cCard(97, 57,   "Q", "D",  "Q", "", 12);		
			Card[97]  = new cCard(98, 58,   "Q", "D", "HD", "HOOFERS-DOOPERS", 12);		
			Card[98]  = new cCard(99, 59,   "K", "D",  "K", "", 13);							
			Card[99]  = new cCard(100,60, "ACE", "D", "AL", "Ace 'N' Lay", 1);							
			Card[100] = new cCard(101,61, "ACE", "D", "AE", "Ace 'N' End", 1);					
		
			// ACE=JACK
			Card[101] = new cCard(102,62, "ACE", "U", "AJ", "ACE-JACK", 1);
			Card[102] = new cCard(103,62, "ACE", "U", "AJ", "ACE-JACK", 1);				
			
			// Extra Card. We will use these extra cards for A.I.
			// Since we don't have an A-Card Diamond, we will temporarily add one.
			ExtraCard[0]  = new cCard(1000, 0, "ACE", "D",  "A", "", 1);	
			// Since we don't have an Ace 'n' End Clubs and Heart, we will temporarily add one.
			ExtraCard[1]  = new cCard(1001, 0, "ACE", "C",  "AE", "", 1);	
			ExtraCard[2]  = new cCard(1002, 0, "ACE", "H",  "AE", "", 1);	
			// Since we don't have an Ace-Jack Clubs, Spade, Diamonds and Hearts, we will temporarily add one.
			ExtraCard[3]  = new cCard(1003, 0, "ACE", "C",  "AJ", "", 1);	
			ExtraCard[4]  = new cCard(1004, 0, "ACE", "S",  "AJ", "", 1);	
			ExtraCard[5]  = new cCard(1005, 0, "ACE", "H",  "AJ", "", 1);	
			ExtraCard[6]  = new cCard(1006, 0, "ACE", "D",  "AJ", "", 1);	
			
			if(isDebug)
			{
				// Clubs
				TempCard[0]   = new cCard(1,  1,  "ACE", "C",  "A", "", 1);
				TempCard[1]   = new cCard(2,  2,    "2", "C",  "2", "", 2);
				TempCard[2]   = new cCard(3,  2,    "2", "C",  "2", "", 2);	
				TempCard[3]   = new cCard(4,  3,    "3", "C",  "3", "", 3);
				TempCard[4]   = new cCard(5,  3,    "3", "C",  "3", "", 3);	
				TempCard[5]   = new cCard(6,  4,  "FLP", "C",  "4", "", 4);	
				TempCard[6]   = new cCard(7,  4,  "FLP", "C",  "4", "", 4);		
				TempCard[7]   = new cCard(8,  4,  "FLP", "C",  "4", "", 4);	
				TempCard[8]   = new cCard(9,  4,  "FLP", "C",  "4", "", 4);		
				TempCard[9]   = new cCard(10, 5,   "5", "C",  "5", "", 5);	
				TempCard[10]  = new cCard(11, 5,    "5", "C",  "5", "", 5);	
				TempCard[11]  = new cCard(12, 6,    "7", "C",  "7", "", 7);	
				TempCard[12]  = new cCard(13, 6,    "7", "C",  "7", "", 7);		
				TempCard[13]  = new cCard(14, 7,    "8", "C",  "8", "", 8);	
				TempCard[14]  = new cCard(15, 7,    "8", "C",  "8", "", 8);		
				TempCard[15]  = new cCard(16, 8,    "9", "C",  "9", "", 9);	
				TempCard[16]  = new cCard(17, 8,    "9", "C",  "9", "", 9);	
				TempCard[17]  = new cCard(18, 9,   "10", "C", "10", "", 10);	
				TempCard[18]  = new cCard(19, 9,   "10", "C", "10", "", 10);	
				TempCard[19]  = new cCard(20, 10,   "J", "C",  "J", "", 11);	
				TempCard[20]  = new cCard(21, 11,   "J", "C", "UJ", "UP-JACKS", 11);		
				TempCard[21]  = new cCard(22, 12,   "Q", "C",  "Q", "", 12);		
				TempCard[22]  = new cCard(23, 13,   "Q", "C", "HD", "HOOFERS-DOOPERS", 12);		
				TempCard[23]  = new cCard(24, 14,   "K", "C",  "K", "", 13);			
				TempCard[24]  = new cCard(25, 15, "ACE", "C", "AL", "Ace 'N' Lay", 1);				
			
				// Spades
				TempCard[25]  = new cCard(26, 16, "ACE", "S",  "A", "", 1);
				TempCard[26]  = new cCard(27, 17,   "2", "S",  "2", "", 2);
				TempCard[27]  = new cCard(28, 17,   "2", "S",  "2", "", 2);
				TempCard[28]  = new cCard(29, 18,   "3", "S",  "3", "", 3);	
				TempCard[29]  = new cCard(30, 18,   "3", "S",  "3", "", 3);	
				TempCard[30]  = new cCard(31, 19, "FLP", "S",  "4", "", 4);	
				TempCard[31]  = new cCard(32, 19, "FLP", "S",  "4", "", 4);	
				TempCard[32]  = new cCard(33, 19, "FLP", "S",  "4", "", 4);	
				TempCard[33]  = new cCard(34, 19, "FLP", "S",  "4", "", 4);	
				TempCard[34]  = new cCard(35, 20,   "5", "S",  "5", "", 5);	
				TempCard[35]  = new cCard(36, 20,   "5", "S",  "5", "", 5);	
				TempCard[36]  = new cCard(37, 21,   "7", "S",  "7", "", 7);
				TempCard[37]  = new cCard(38, 21,   "7", "S",  "7", "", 7);
				TempCard[38]  = new cCard(39, 22,   "8", "S",  "8", "", 8);	
				TempCard[39]  = new cCard(40, 22,   "8", "S",  "8", "", 8);	
				TempCard[40]  = new cCard(41, 23,   "9", "S",  "9", "", 9);	
				TempCard[41]  = new cCard(42, 23,   "9", "S",  "9", "", 9);	
				TempCard[42]  = new cCard(43, 24,  "10", "S", "10", "", 10);	
				TempCard[43]  = new cCard(44, 24,  "10", "S", "10", "", 10);	
				TempCard[44]  = new cCard(45, 25,   "J", "S",  "J", "", 11);	
				TempCard[45]  = new cCard(46, 26,   "J", "S", "UJ", "UP-JACKS", 11);		
				TempCard[46]  = new cCard(47, 27,   "Q", "S",  "Q", "", 12);		
				TempCard[47]  = new cCard(48, 28,   "Q", "S", "HD", "HOOFERS-DOOPERS", 12);		
				TempCard[48]  = new cCard(49, 29,   "K", "S",  "K", "", 13);			
				TempCard[49]  = new cCard(50, 30, "ACE", "S", "AL", "Ace 'N' Lay", 1);					
				TempCard[50]  = new cCard(51, 31, "ACE", "S", "AE", "Ace 'N' End", 1);				
			
				// Heart
				TempCard[51]  = new cCard(52, 32, "ACE", "H",  "A", "", 1);	
				TempCard[52]  = new cCard(53, 33,   "2", "H",  "2", "", 2);
				TempCard[53]  = new cCard(54, 33,   "2", "H",  "2", "", 2);
				TempCard[54]  = new cCard(55, 34,   "3", "H",  "3", "", 3);	
				TempCard[55]  = new cCard(56, 34,   "3", "H",  "3", "", 3);	
				TempCard[56]  = new cCard(57, 35, "FLP", "H",  "4", "", 4);	
				TempCard[57]  = new cCard(58, 35, "FLP", "H",  "4", "", 4);	
				TempCard[58]  = new cCard(59, 35, "FLP", "H",  "4", "", 4);	
				TempCard[59]  = new cCard(60, 35, "FLP", "H",  "4", "", 4);	
				TempCard[60]  = new cCard(61, 36,   "5", "H",  "5", "", 5);	
				TempCard[61]  = new cCard(62, 36,   "5", "H",  "5", "", 5);	
				TempCard[62]  = new cCard(63, 37,   "7", "H",  "7", "", 7);
				TempCard[63]  = new cCard(64, 37,   "7", "H",  "7", "", 7);
				TempCard[64]  = new cCard(65, 38,   "8", "H",  "8", "", 8);	
				TempCard[65]  = new cCard(66, 38,   "8", "H",  "8", "", 8);	
				TempCard[66]  = new cCard(67, 39,   "9", "H",  "9", "", 9);	
				TempCard[67]  = new cCard(68, 39,   "9", "H",  "9", "", 9);	
				TempCard[68]  = new cCard(69, 40,  "10", "H", "10", "", 10);	
				TempCard[69]  = new cCard(70, 40,  "10", "H", "10", "", 10);	
				TempCard[70]  = new cCard(71, 41,   "J", "H",  "J", "", 11);	
				TempCard[71]  = new cCard(72, 42,   "Q", "H",  "Q", "", 12);		
				TempCard[72]  = new cCard(73, 43,   "Q", "H", "HD", "HOOFERS-DOOPERS", 12);		
				TempCard[73]  = new cCard(74, 44,   "K", "H",  "K", "", 13);			
				TempCard[74]  = new cCard(75, 45, "ACE", "H", "AL", "Ace 'N' Lay", 1);					
				TempCard[75]  = new cCard(76, 46, "FLP", "H", "MF", "Mega Flap", 1);				
				
				// Diamond
				TempCard[76]  = new cCard(77, 47,   "2", "D",  "2", "", 2);
				TempCard[77]  = new cCard(78, 47,   "2", "D",  "2", "", 2);
				TempCard[78]  = new cCard(79, 48,   "3", "D",  "3", "", 3);	
				TempCard[79]  = new cCard(80, 48,   "3", "D",  "3", "", 3);	
				TempCard[80]  = new cCard(81, 49, "FLP", "D",  "4", "", 4);	
				TempCard[81]  = new cCard(82, 49, "FLP", "D",  "4", "", 4);	
				TempCard[82]  = new cCard(83, 49, "FLP", "D",  "4", "", 4);	
				TempCard[83]  = new cCard(84, 49, "FLP", "D",  "4", "", 4);	
				TempCard[84]  = new cCard(85, 50,   "5", "D",  "5", "", 5);	
				TempCard[85]  = new cCard(86, 50,   "5", "D",  "5", "", 5);	
				TempCard[86]  = new cCard(87, 51,   "7", "D",  "7", "", 7);
				TempCard[87]  = new cCard(88, 51,   "7", "D",  "7", "", 7);
				TempCard[88]  = new cCard(89, 52,   "8", "D",  "8", "", 8);	
				TempCard[89]  = new cCard(90, 52,   "8", "D",  "8", "", 8);	
				TempCard[90]  = new cCard(91, 53,   "9", "D",  "9", "", 9);	
				TempCard[91]  = new cCard(92, 53,   "9", "D",  "9", "", 9);	
				TempCard[92]  = new cCard(93, 54,  "10", "D", "10", "", 10);	
				TempCard[93]  = new cCard(94, 54,  "10", "D", "10", "", 10);	
				TempCard[94]  = new cCard(95, 55,   "J", "D",  "J", "", 11);	
				TempCard[95]  = new cCard(96, 56,   "J", "D", "UJ", "UP-JACKS", 11);		
				TempCard[96]  = new cCard(97, 57,   "Q", "D",  "Q", "", 12);		
				TempCard[97]  = new cCard(98, 58,   "Q", "D", "HD", "HOOFERS-DOOPERS", 12);		
				TempCard[98]  = new cCard(99, 59,   "K", "D",  "K", "", 13);							
				TempCard[99]  = new cCard(100,60, "ACE", "D", "AL", "Ace 'N' Lay", 1);							
				TempCard[100] = new cCard(101,61, "ACE", "D", "AE", "Ace 'N' End", 1);					
			
				// ACE=JACK
				TempCard[101] = new cCard(102,62, "ACE", "U", "AJ", "ACE-JACK", 1);
				TempCard[102] = new cCard(103,62, "ACE", "U", "AJ", "ACE-JACK", 1);								
			}
			
			TotalCards = MAX_CARD;
		}
		
		public function Shuffle()
		{
			var n;
			var b;
			var c;
	
			c = 0;
			n = 0;
			
			InitializeCards();
			// clear arrays
			Stock   = new Array();
			Waste   = new Array();
			Player  = new Array();
			AceCard = new Array();
			
			while(c<TotalCards)
			{
				b = false;
				n = GenRnd(1, TotalCards);
				
				for(var i=0; i<c; i++)
					// is card already exist?
					if(Stock[i][0].CardId==n)
					{
						// yes, ignore it!
						b = true;
						break;
					}
		
				if(!b)
				{
					// add new card.
					// [Object], Face-Up, Player, FlapsCardId, Enabled, Visible
					Stock.push(new Array(Card[n-1], false, -1, c+1, true, true));
					c++;
				}
			}
			
			// Lets use 1000-1015 as our id for cards. 
			// A-Card
			AceCard.push(new Array(Card[0],      false, -1, 0, true, true));
			AceCard.push(new Array(Card[25],     false, -1, 0, true, true));
			AceCard.push(new Array(Card[51],     false, -1, 0, true, true));
			AceCard.push(new Array(ExtraCard[0], false, -1, 0, true, true));
			// Ace 'n' End
			AceCard.push(new Array(Card[50],     false, -1, 0, true, true));
			AceCard.push(new Array(Card[100],    false, -1, 0, true, true));
			AceCard.push(new Array(ExtraCard[1], false, -1, 0, true, true));
			AceCard.push(new Array(ExtraCard[2], false, -1, 0, true, true));
			// Ace 'n' Lay
			AceCard.push(new Array(Card[24],     false, -1, 0, true, true));
			AceCard.push(new Array(Card[49],     false, -1, 0, true, true));
			AceCard.push(new Array(Card[74],     false, -1, 0, true, true));
			AceCard.push(new Array(Card[99],     false, -1, 0, true, true));
			// Ace-Jack
			AceCard.push(new Array(ExtraCard[3], false, -1, 0, true, true));
			AceCard.push(new Array(ExtraCard[4], false, -1, 0, true, true));
			AceCard.push(new Array(ExtraCard[5], false, -1, 0, true, true));
			AceCard.push(new Array(ExtraCard[6], false, -1, 0, true, true));
			
			// Deal seven cards to each player.
			DistributeCards();
			// Turn over the first card and place it face up alonside the pack.
			StockToWaste();
		}
		
		public function StockToWaste()
		{
			Stock[Stock.length-1][5] = false;
			// throw the card
			Waste.push(Stock[Stock.length-1]);
			// Remove one card in stock.
			PickFromStock(1, -1, true);			
		}
		
		public function GetPlayerTotalCards(P : Number)
		{
			whosPlayer = P;
			return Player.filter(IteratePlayerCards).length;
		}
		
		public function PickFromStock(N : Number, whosPlayer : Number, isFaceUp : Boolean)
		{
			for(var i=0; i<N; i++)
				if(Stock.length>0)
				{
					if(whosPlayer>0)					
					{
						Stock[Stock.length-1][1] = isFaceUp;
						Stock[Stock.length-1][2] = whosPlayer;
						Player.push(Stock[Stock.length-1]);
					}
					
					Stock.pop();
				}
				else
					break;
		}
		
		public function HasEffect(code:String):Boolean
		{
			switch(code)
			{
				case  "5":
				case  "Q":
				case  "K":
					return false;
			}
			
			return true;
		}
		
		private function IterateCardOwner(element:*, index:int, arr:Array):Boolean 
		{
			if(arr[index][3] == selFlapsCardId)
				cardIndex = index;
            return arr[index][3] == selFlapsCardId;
        }
		
		public function GetCardOwner(FlapsCardId : int)
		{
			selFlapsCardId = FlapsCardId;
			
			var n:Array = Player.filter(IterateCardOwner);

			if(n.length>0)
				return n[0][2];
			else
				return -1;
		}
		
		private function IteratePlayer(element:*, index:int, arr:Array):Boolean
		{
            return arr[index][3] == selFlapsCardId;
        }
		
		public function Remove(FlapsCardId : Number)
		{
			selFlapsCardId = FlapsCardId;
			GetCardOwner(FlapsCardId);
			Player.filter(IteratePlayer);
			Player.splice(cardIndex, 1);
		}
		
		public function Lay(FlapsCardId : Number, isMF : Boolean)
		{
			selFlapsCardId = FlapsCardId;			
			
			var n:Array = Player.filter(IteratePlayer);
			var action : String = "XX";
			
			if(n.length>0)
			{
				action = chkRule(n, Waste[Waste.length-1], isMF);
				
				if(action!="XX")
				{
					switch(action)
					{
						case "x1":
							break;
						default:
							Waste.push(n[0]);	
							Player.filter(IteratePlayer);
							Player.splice(cardIndex, 1);
							break;
					}
					
					return action;
				}
				else
					return action;
			}
			else
				return action;
		}
		
		public function IsRule(FlapsCardId : Number, w:Object, isMF:Boolean)
		{
			selFlapsCardId = FlapsCardId;			
			
			var n      : Array  = Player.filter(IteratePlayer);
			var action : String = "XX";
				
			if(n.length>0)
				action = chkRule(n, w, isMF);
			else
				action = "XX";
				
			return action;
		}

		public function GetCardLaid():String
		{
			return Waste[Waste.length-1][0].Type+" "+
 				   GetSuitDescription(Waste[Waste.length-1][0].Suit)+" "+
				   Waste[Waste.length-1][0].Description;
		}
					
		private function chkRule(n:Array, w:Object, isMF:Boolean)
		{
			var bRule  : Boolean = false;
			var action : String  = ""; // normal game
			
			// same suit
			if(n[0][0].Suit==w[0].Suit)
				bRule = true;
			// same number
			if(!bRule)
				if(n[0][0].Type==w[0].Type)
					bRule = true;
			// HOOFERS-DOOFERS can be laid on any 10 suit
			if(!bRule)
				if((n[0][0].Code=="HD") && (w[0].Type=="10"))
					bRule = true;
			// MEGA-FLAPS Lay up to three more flaps without having to wait
			//            for other players to interleave.
			if(!bRule)
				if((n[0][0].Type=="FLP") && (w[0].Type=="FLP") && isMF)
					bRule = true;					
			// ACE card can be laid on any card
			if(!bRule)			
				if(n[0][0].Type=="ACE") 
					bRule = true;
					
			// Jack can be load on Ace-Jack.
			if(!bRule)
				if((n[0][0].Code=="J") && (w[0].Code=="AJ"))
					bRule = true;
			// Up-Jacks can be load on Ace-Jack.
			if(!bRule)
				if((n[0][0].Code=="UJ") && (w[0].Code=="AJ"))
					bRule = true;
					
			if(bRule)
			{
				if(GetPlayerCards(n[0][2]).length==1)
				{
					if((n[0][0].Type=="ACE") && (n[0][0].Code=="A"))
						action = "x1"; 
						
					if((n[0][0].Type=="ACE") && (n[0][0].Code=="AJ"))
						action = "x1";	
				}

				if(GetPlayerCards(n[0][2]).length==2)
				{
					if((n[0][0].Type=="ACE") && (n[0][0].Code=="AL"))
						action = "x2"; 				
				}
				
				if(action=="")
				{
					//  A -> Change suit to one of your choice.
					if((n[0][0].Type=="ACE") && (n[0][0].Code=="A"))
						action = "AA"; 
					// AL -> Change suit to one of your choice.
					if((n[0][0].Type=="ACE") && (n[0][0].Code=="AL"))
						action = "AL"; 
					//  2 -> Next player pick up two cards or sum of cards laid.
					if((n[0][0].Type=="2") && (n[0][0].Code=="2"))
						action = "02"; 	
					//  3 -> Next player pick up three cards or sum of cards laid.
					if((n[0][0].Type=="3") && (n[0][0].Code=="3"))
						action = "03";					
					//  4 -> Flaps.
					if((n[0][0].Type=="FLP") && (n[0][0].Code=="4"))
						action = "04"; 	
					// 10 -> Choose any other player to pick up one card. Unless they have a 
					//       HOOFERS-DOOFERS card.
					//  7 -> No effect unless you are attacked with 2, 3 or any 7.
					//       Then reverses direction and sum of 2s and 3s.
					if((n[0][0].Type=="7") && (n[0][0].Code=="7"))
						action = "07";	
					//  8 -> Next player miss a go or lay another 8.
					if((n[0][0].Type=="8") && (n[0][0].Code=="8"))
						action = "08"; 						
					//  9 -> No effect unless you are attacked with 2, 3 or any 7.
					//       Then cancel pick up.				
					if((n[0][0].Type=="9") && (n[0][0].Code=="9"))
						action = "09";									
					if((n[0][0].Type=="10") && (n[0][0].Code=="10"))
						action = "10"; 			
					//  J -> Reverses direction of play. Can be laid on any ace-jack.
					if((n[0][0].Type=="J") && (n[0][0].Code=="J"))
						action = "JJ"; 
					// UJ -> All players (except you) pick up one card starting with the player
					//       to your left. Reverses direction of play.
					if((n[0][0].Type=="J") && (n[0][0].Code=="UJ"))
						action = "UJ"; 
					// HD -> No effect unless you are attacked with a 10 or active HOOFERS-DOFERS.
					//       Then choose someone to pick up one card.
					if((n[0][0].Type=="Q") && (n[0][0].Code=="HD"))
						action = "HD"					
					// AJ -> Reverses direction play. Change suit to one of your choice.
					//       Sorry but you cannot finish on this card.
					if((n[0][0].Type=="ACE") && (n[0][0].Code=="AJ"))
						action = "AJ"; 				
					// AE -> Change suit to one of your choice.
					//       You can finish on this card.
					if((n[0][0].Type=="ACE") && (n[0][0].Code=="AE"))
						action = "AE"; 		
					// MF -> Lay up to 3 more flaps.
					if((n[0][0].Type=="FLP") && (n[0][0].Code=="MF"))
						action = "MF"; 					
				}
			}
			else
				action = "XX"; // not in the rule.
				
			return action;
		}
		
		private function IterateStock(element:*, index:int, arr:Array):Boolean {
            return arr[index][3] == selFlapsCardId;
        }
		
		public function isStock(FlapsCardId : int)
		{
			selFlapsCardId = FlapsCardId;
			return (Stock.filter(IterateStock).length) > 0;
		}
		
		private function IterateSearchCards(element:*, index:int, arr:Array):Boolean {
            return (arr[index][0].Type == selCardType) && 
				   (arr[index][0].Code == selCardCode) &&
				   (arr[index][2]      == whosPlayer);
        }
		
		public function GetCardCount(type : String, code : String, N : Number)
		{
			selCardType = type;
			selCardCode = code;
			whosPlayer  = N;
			return Player.filter(IterateSearchCards).length;
		}
		
		public function GetCardInfo(FlapsCardId : int)
		{
			selFlapsCardId = FlapsCardId;
			return Player.filter(IterateStock);
		}		
		
		private function IterateSearchAceCard(element:*, index:int, arr:Array):Boolean
		{
            return arr[index][0].CardId == whichCardId;
        }
		
		public function SearchAceCard(CardId : int):Array
		{
			whichCardId = CardId;
			return AceCard.filter(IterateSearchAceCard);
		}
		
		private function IteratePlayerCards(element:*, index:int, arr:Array):Boolean {
            return arr[index][2] == whosPlayer;
        }
		
		public function GetPlayerCards(N : Number):Array
		{
			if(N>0)
			{
				whosPlayer = N;
				return Player.filter(IteratePlayerCards);
			}
			else
				return Player;
		}
		
		public function GetCurrentPlayer():Number
		{
			return Waste[Waste.length-1][2];
		}
		
		private function IterateStockCards(element:*, index:int, arr:Array):Boolean 
		{
            return arr[index].Suit == whichSuit;
        }
		
		private function IterateCards(element:*, index:int, arr:Array):Boolean
		{
            return arr[index].Suit == whichSuit;
        }
		
		public function GetCards(Suit : String):Array
		{
			whichSuit = Suit;
			return TempCard.filter(IterateCards);
		}

		private function IteratePlayersCard(element:*, index:int, arr:Array):Boolean {
            return arr[index][3] == selFlapsCardId;
        }
		
		public function ChangeCard(CardId : Number, FlapsCardId : Number)
		{
			selFlapsCardId = FlapsCardId;
			var p:Array = Player.filter(IteratePlayersCard);
			
			if(p.length>0)
			{
				p[0][0].CardId      = Card[CardId].CardId;
				p[0][0].FrameId     = Card[CardId].FrameId;
				p[0][0].Type        = Card[CardId].Type;
				p[0][0].Suit        = Card[CardId].Suit;
				p[0][0].Code 	    = Card[CardId].Code;
				p[0][0].Description = Card[CardId].Description;
				p[0][0].Value       = Card[CardId].Value;
				
				return Card[CardId].FrameId;
			}
			else 
				return -1;
		}
		
/*		public function FaceUp(isFaceUp : Boolean, FlapsCardId : Number)
		{
			selFlapsCardId = FlapsCardId;
			var p:Array = Player.filter(IteratePlayersCard);
			
			if(p.length>0)
				trace(p[0][1]);
		}*/
		
		private function DistributeCards()
		{
			var pn : Number = 0;
			
			for(var i=0; i<7 * GetTotalPlayers(); i++)
			{
				if(i%7==0) pn++;
				
				// for debugging, change 1 index to true
				Stock[Stock.length-1][1] = pn==1;	
				// which player (1-8)? 1 -> Player 1, 
				//					   2 -> Player 2,
				//					   etc...	
				Stock[Stock.length-1][2] = pn;				
				// deal each card.
				Player.push(Stock[Stock.length-1]);
				// pick a card from stock.
				PickFromStock(1, -1, true)
			}
		}
		
		public function ChangeSuit(S : String)
		{
			Waste[Waste.length-1][0].Suit = S;
		}
		
		public function GetLastSuit()
		{
			return Waste[Waste.length-1][0].Suit;
		}
		
		public function SetTotalPlayers(N : Number)
		{
			nPlayers = N;
		}
		
		public function GetTotalPlayers()
		{
			return nPlayers;
		}
		
		public function GetTotalStock()
		{
			return Stock.length; 
		}
		
		public function GetBackFrameId()
		{
			return BACK_FRAME_ID;
		}
		
		public function GetSuitDescription(S : String)
		{
			switch(S)
			{
				case "C":
					return "Clubs";
				case "S":
					return "Spade";
				case "H":
					return "Heart";
				case "D":
					return "Diamond";
				case "U":
					return "";
			}
		}
		
		public function GetSuitIndex(S : String)
		{
			switch(S)
			{
				case "C": // Clubs
					return 0;
				case "S": // Spade
					return 25;
				case "H":
					return 51;
				case "D":
					return 76;
				case "U":
					return 101;
			}
		}
					
		// Generates a random number that falls within a range.
		private function GenRnd(low:Number, high:Number)
		{
			return Math.ceil((high-low+1) * Math.random()+low)-1;
		}
	}
}
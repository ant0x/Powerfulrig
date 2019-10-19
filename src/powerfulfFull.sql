-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: powerfulrig
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS powerfulrig;
Create database powerfulrig;
--
-- Table structure for table `composizione`
--
use powerfulrig;
DROP TABLE IF EXISTS `composizione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `composizione` (
  `quantita` int(11) NOT NULL,
  `prezzo` float NOT NULL,
  `fattura` int(11) NOT NULL,
  `IdProdotto` int(11) NOT NULL,
  PRIMARY KEY (`fattura`,`IdProdotto`),
  KEY `IdProdotto` (`IdProdotto`),
  CONSTRAINT `composizione_ibfk_1` FOREIGN KEY (`fattura`) REFERENCES `fattura` (`numero_fattura`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `composizione_ibfk_2` FOREIGN KEY (`IdProdotto`) REFERENCES `prodotto` (`IdProdotto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composizione`
--

LOCK TABLES `composizione` WRITE;
/*!40000 ALTER TABLE `composizione` DISABLE KEYS */;
INSERT INTO `composizione` VALUES (1,250.99,1,1),(1,249.99,2,15),(1,4999.99,2,17);
/*!40000 ALTER TABLE `composizione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fattura`
--

DROP TABLE IF EXISTS `fattura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fattura` (
  `numero_fattura` int(11) NOT NULL AUTO_INCREMENT,
  `totale` float NOT NULL,
  `metodo_pagamento` varchar(40) NOT NULL,
  `data_fattura` date NOT NULL,
  `Email_utente` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`numero_fattura`),
  KEY `Email_utente` (`Email_utente`),
  CONSTRAINT `fattura_ibfk_1` FOREIGN KEY (`Email_utente`) REFERENCES `utente` (`Email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fattura`
--

LOCK TABLES `fattura` WRITE;
/*!40000 ALTER TABLE `fattura` DISABLE KEYS */;
INSERT INTO `fattura` VALUES (1,256,'paypal','2019-07-31','antonio.baldi98@gmail.com'),(2,4999.99,'postepay','2019-07-31','francesco.lauro@gmail.com');
/*!40000 ALTER TABLE `fattura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodotto`
--

DROP TABLE IF EXISTS `prodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `prodotto` (
  `Watt` int(11) NOT NULL,
  `IdProdotto` int(11) NOT NULL AUTO_INCREMENT,
  `PercentualeSconto` int(11) DEFAULT '0',
  `Prezzo` float NOT NULL,
  `Specifica` varchar(400) NOT NULL,
  `Marca` varchar(20) NOT NULL,
  `Quantita` int(11) DEFAULT '1',
  `Nome` varchar(30) NOT NULL,
  `Modello` varchar(20) NOT NULL,
  `Tipo` varchar(20) NOT NULL,
  `Descrizione` longtext,
  `path` varchar(50) DEFAULT NULL,
  `Visualizzabile` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`IdProdotto`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotto`
--

LOCK TABLES `prodotto` WRITE;
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
INSERT INTO `prodotto` VALUES (650,1,0,65.39,'Semi modulare,  650 watt, Certificazione 80 plus gold,','Corsair',17,'Corsair TX650M Alimentatore PC','TX650M','PSU','La serie di alimentatori semi modulari Corsair TX-M offre tensioni di alimentazioni estremamente precise e pulite, per la massima stabilità e affidabilità del vostro sistema, e un vantaggioso sistema di cablaggi modulari. Costruiti al 100% con condensatori Giapponesi con rating a 105°C gli alimentatori Corsair della serie TX-M sono la scelta ideale per i sistemi ad elevate prestazioni che richiedono la massima affidabilità. Gli alimentatori Corsair della serie TX.M sono certificati 80+ gold, un livello di efficienza energetica che oltre a ridurre i costi operativi grazie al risparmio di elettricità vi permette anche di avere meno dispersione di calore all\'interno del vostro PC. La ventola con cuscinetti rifle bearing garantisce massima efficienza nella dissipazione del calore unita ad estrema silenziosità e durata. I cavi modulari colorati di nero vi permettono di effettuare cablaggi puliti e ordinati andando a utilizzare solo ed esclusivamente i connettori che vi servono. Tutti gli alimentatori Corsair della serie TX.M sono coperti da 7 anni di garanzia e il nostro supporto tecnico è sempre a vostra disposizione per la massima affidabilità del vostro PC.','img/prodotti/tx650m',1),(95,2,0,249,'LGA_1151, 3.7 Ghz di frequenza di clock turbo boost 4.6 Ghz, 6 core 6 thread, Coffe lake, Intel UHD Graphics 630 integrato ','Intel',65,'I5-9600k','BX80684I59600K','Cpu_comp','Intel i5-9600K, Core. Famiglia processore: Intel Core i5-9xxx, Frequenza del processore: 3,7 GHz, Presa per processore: LGA 1151 (Presa H4). Canali di memoria supportati dal processore: Doppio, Memoria interna massima supportata dal processore: 64 GB, Tipologie di memoria supportati dal processore: DDR4-SDRAM. Modello scheda grafica integrata: Intel UHD Graphics 630, Memoria massima dell\'adattatore della scheda grafica installata: 64 GB, Frequenza di base dell\'adattatore della scheda grafica integrata: 350 MHz.  Chipset compatibile: Intel Z390, Intel B360, Intel H310, Intel H370, Intel Q370, Intel Z370','img/prodotti/i5-9600k',1),(95,3,0,379.99,'LGA_1151, 3.6 Ghz di frequenza di clock turbo boost 4.9 Ghz, 8 core 8 thread, Coffe lake, Intel UHD Graphics 630 integrato ','Intel ',11,'I7-9700k','BX80684I79700K','Cpu_comp','ntel i7-9700K, Core. Famiglia processore: Intel Core i7-9xxx, Frequenza del processore: 3,6 GHz, Presa per processore: LGA 1151 (Presa H4). Canali di memoria supportati dal processore: Doppio, Memoria interna massima supportata dal processore: 64 GB, Tipologie di memoria supportati dal processore: DDR4-SDRAM. Modello scheda grafica integrata: Intel UHD Graphics 630, Memoria massima dell\'adattatore della scheda grafica installata: 64 GB, Uscite supportate dell\'adattatore della scheda grafica integrata: DisplayPort,Embedded DisplayPort (eDP),HDMI.','img/prodotti/i7-9700k',1),(65,4,0,230.15,'AM4, 3.6 Ghz di frequenza di clock, Scheda grafica integrata: No, 6 core 12 thread, Dissipatore stock incluso','Amd',26,'Ryzen 5 3600','Ryzen 5 3600','Cpu_comp','AMD 3600, Ryzen. Famiglia processore: AMD Ryzen 5, Frequenza del processore: 3,6 GHz, Presa per processore: Presa AM4. Canali di memoria supportati dal processore: Doppio, Tipologie di memoria supportati dal processore: DDR4-SDRAM, Velocità memory clock supportate dal processore: 3200 MHz. Thermal Design Power (TDP): 65 W. configurazione PCI Express: 1x16','img/prodotti/ryzen-5-3600',1),(180,5,0,839.9,'AM4, 3.5 Ghz di frequenza di clock turbo boost 4,4 Ghz, 16 core 32 thread, 32 MB di cache,','Amd',12,'Ryzen Threadripper 2950 x ','YD295XA8AFWOF','Cpu_comp','AMD 2nd Gen 16 Core Ryzen Threadripper 2 Processore sbloccato 2950X AMD Ryzen ™ Threadripper 2950X, TR4, Zen +, 16 core, 32 thread, 3,5 GHz, Turbo a 4,4 GHz, 32 MB di cache, 64 canali, 180 W, CPU','img/prodotti/2950x',1),(5,6,0,89.9,'NZXT H500. Fattore di forma: Midi-Tower, Tipo: PC, Materiali: SECC, Acciaio, Vetro temperato.','NZXT',23,'NZXT H500 Case mid-tower ATX, ','CA-H500B-B1','Case_comp','La H500 mostra il design ottimo delle custodie della serie H della serie NZXT. L\'elegante struttura interamente in acciaio include il sistema di gestione dei cavi per semplificare la costruzione e l\'aggiornamento del sistema. È possibile creare facilmente un sistema potente con numerose opzioni per l\'archiviazione e il raffreddamento. L\'H500 include due ventole Aer F e un pannello laterale in vetro temperato senza cuciture.','img/prodotti/nzxt-h500',1),(90,7,0,749.9,'Asus ROG SWIFT PG279Q Gaming Monitor, 27\'\' WQHD 2560 x 1440 IPS, fino a 165 Hz, DP, HDMI, USB 3.0, G-SYNC','Asus Rog',1,'Asus Rog Swift','PG279Q','Monitor_comp','Il display Swift PG279Q è costruito per garantire la vittoria nell\'arena di gioco professionale, dotato di un pannello WQHD con una frequenza di aggiornamento 165Hz.','img/prodotti/monitor-asus-rog',1),(5,8,0,115.35,'MSI GUNGNIR. Fattore di forma: Midi-Tower, Tipo: PC, Materiali: SECC, Acciaio, Vetro temperato.','Msi',12,'MSI GUNGNIR','MSI GUNGNIR','Case_comp','L\'MPG GUNGNIR 100D mostra GAMING, sangue ed entusiasmo con la combinazione del logo MSI rosso e l\'immagine simbolica del drago potente. Con l\'arma leggendaria - Gungnir, Dragon Knight si sta svegliando per combattere per qualsiasi cosa. l\'MPG GUNGNIR 100D adotta un design industriale semplice con ottimizzazione della durata e ottimizzazione del fai-da-te. Inoltre, è dotato di una ventola di sistema da 120 mm, pannello laterale in vetro temperato da 4 mm, spazio di raffreddamento riservato, che si combina abilmente con gli elementi di gioco unici MSI. Chiara vista internaIl tono grigio chiaro del pannello laterale in vetro temperato da 4 mm è ideale per la visualizzazione di effetti di illuminazione RGB e offre una chiara struttura interna dei componenti.Supporta l\'installazione di un dispositivo di raffreddamento CPU fino a 170 mm per garantire la massima compatibilitàLo spazio interno del case è sufficiente per supportare l\'installazione di una scheda grafica fino a 400 mm.','img/prodotti/MSI_100D',1),(5,9,0,204.9,'Corsair Full-Tower. Fattore di forma: Midi-Tower, Tipo: PC, Materiali: SECC, Acciaio, Vetro temperato.','Corsair',3,'Corsair Full-Tower','Corsair 780T','Case_comp','l design avveniristico del case per PC full-tower Graphite Series 780T offre un\'ampia capacità di dissipazione e lascia molto spazio a disposizione per eventuali espansioni: è quindi perfetto per esigenze di overclocking di fascia alta o per piattaforme di gioco.','img/prodotti/Corsair_780T',1),(5,10,0,89.9,'NZXT H500. Fattore di forma: Midi-Tower, Tipo: PC, Materiali: SECC, Acciaio, Vetro temperato.','NZXT',7,'NZXT Mid Tower white','H500','Case_comp','NZXT H500. Fattore di forma: Midi-Tower, Tipo: PC, Materiali: SECC, Acciaio, Vetro temperato. Diametro delle ventole frontali supportato: 120,140 mm, Diametro delle ventole posteriori supportato: 120 mm, Diametri delle ventole superiori supportati: 120,140 mm. Dimensioni di hard disk drive supportati: 2.5,3.5\". Larghezza: 210 mm, Profondità: 428 mm, Altezza: 460 mm','img/prodotti/NZXT_H500',1),(5,11,0,64.9,'Corsair Carbide. Fattore di forma: Midi-Tower, Tipo: PC, Materiali: SECC, Acciaio, Vetro temperato.','Corsair',2,'Corsair Carbide','SPEC-04','Case_comp','L’aspetto esterno angolare e affilato del case Carbide Series SPEC-04, combinato con l’eccellente potenziale di raffreddamento, aggiunge uno stile grintoso alla facilità di assemblaggio.','img/prodotti/Corsair_Carbide_SPEC-04',1),(0,12,0,689,'sedia da ufficio R100S Sparco nero blu, seggiolino auto replica sportivo Sparco. , la sella più bassa e più larga per aumentare il comfort. ','Sparco',2,'Sparco Comp','C','Sedia_comp','Seduta ribassata e allargata per un maggiore confort e uno schienale regolabile sia nell\'inclinazione che nella regolazione lombare.La sedia è fornita di dispositivo antiribaltamento con blocco dello schienale 150° ed è completa di base con pistone certificato SGS / BIFMAX5.1 / EN1335 oltre che di un meccanismo basculante e base in alluminio lucidato con 5 solide ruote.Braccioli del tipo 4D con movimento multidirezionale. Sedile disponibile nei colori nero/nero; nero/verde; nero/azzurro.','img/prodotti/Sparco_C',1),(0,13,0,106.99,'La sedia con un design ergonomico, ideale per lavorare, studiare o giocare per lungo tempo,La sedia può girare per 360 gradi, la sua altezza della seduta e dei braccioli è regolabile','WOLTU',5,'WOLTU Ecopelle','BS13rt','Sedia_comp','Materiale: La superficie in ecopelle, i braccioli e i piedi in plastica di alta qualità, il cuscino è composto da schiuma di poliuretano ad alta densità. Dimensioni: Altezza totale (regolabile): 127-135 cm; Altezza dello schienale: 84 cm; Seduta: 40x54 cm; Diametro Base: 64 cm; Carico massimo: 150 kg','img/prodotti/WOLTU_BS13rt',1),(0,14,0,174.9,'La sedia con un design ergonomico, ideale per lavorare, studiare o giocare per lungo tempo,La sedia può girare per 360 gradi, la sua altezza della seduta e dei braccioli è regolabile','CoolerMaster',4,'CoolerMaster CALIBER','R1','Sedia_comp','Sedia da gaming Caliber R1, una soluzione ideale per chi trascorre diverse ore della giornata davanti ad un computer, per lavoro o per divertimento, e che strizza l’occhio sia al design sia a un comfort senza confini.','img/prodotti/CoolerMaster_R1',1),(0,15,0,186.9,'La sedia con un design ergonomico, ideale per lavorare, studiare o giocare per lungo tempo,La sedia può girare per 360 gradi, la sua altezza della seduta e dei braccioli è regolabile','CoolerMaster',6,'CoolerMaster CALIBER','R12','Sedia_comp','Sedia da gaming Caliber R12, una soluzione ideale per chi trascorre diverse ore della giornata davanti ad un computer, per lavoro o per divertimento, e che strizza l’occhio sia al design sia a un comfort senza confini.','img/prodotti/CoolerMaster_R12',1),(0,16,0,189.99,'La sedia con un design ergonomico, ideale per lavorare, studiare o giocare per lungo tempo,La sedia può girare per 360 gradi, la sua altezza della seduta e dei braccioli è regolabile','Diablo',2,'Diablo Songmics','X-Ray','Sedia_comp','Sedia da ufficio dal design sportivo da corsa, dalla forma ergonomica, Lavorazione di alta qualità, perfetta per l\'uso in ufficio e casa','img/prodotti/Diablo_X-Ray',1),(1300,17,0,4999.99,'Core i9 7920X,rtx 2080ti, 2tb ssd nvme m.2, ram 32gb ddr4, ','Omen by hp',1,'Omen x','900-291nl','Pc_comp','Hp OMEN X By HP è uno dei PC da gioco più particolari sul mercato, caratterizzato da specifiche tecniche all\'avanguardia e da un design unico.','img/prodotti/TechLord_OMEN',1),(600,18,0,3199.99,'Core i7-9700k, rtx 2080, Raffreddato a liquido, ssd m.2 da 480gb, hdd da 2tb,ram ddr4 da 32gb ','Corsair',3,'Corsair ONE i140','ONE i140','Pc_comp','CORSAIR ONE i140 ridefinisce ciò che puoi aspettarti da un PC gaming ad alte prestazioni. Dotato del potente processore a otto core Intel Core i7-9700K, scheda grafica NVIDIA GeForce RTX 2080 e la pluripremiata memoria CORSAIR DDR4, CORSAIR ONE offre tutte le prestazioni di un PC di alto livello in un fattore di forma ultra ridotto, realizzato in alluminio sabbiato di livello premium da 2 mm di spessore. Un sistema brevettato di raffreddamento a liquido a convezione assistita unisce prestazioni incredibili a temperature ridotte e rumorosità minima, mentre l\'illuminazione RGB integrata e il potente software CORSAIR iCUE ti consentono di personalizzare l\'aspetto del tuo sistema e di sincronizzare i profili di illuminazione tra tutti i tuoi prodotti compatibili CORSAIR iCUE.','img/prodotti/TechLord_ONEi140',1),(430,19,0,999.99,'i5-7400, gtx 1060, ssd nvme m.2 da 256gb, ram ddr da 8gb','Asus Rog',2,'ROG GR 8 II','ROG GR 8 II','Pc_comp','Asus PC MODELLO: GR8; PROCESSORE:Intel, Core i5, 3 GHz, 64 bit; RAM:8 GB; MEMORIA DI MASSA:256 GB, NGFF SSD; GRAFICA:Nvidia, GeForce GTX1060, 3072 MB; SISTEMA OPERATIVO & SOFTWARE:Windows 10, Home, Bit S.O. : 64 , 12 months; UNIT','img/prodotti/TechLord_ROG',1),(750,20,0,2149.99,'i7-9700k, rtx 2080, ssd nvme m.2 da 512gb, ram da 16gb ddr4 2666Mhz','Msi',2,'Trident X','Trident X','Pc_comp','Il design ricercato dell\'MSI Trident X Plus e gli interni accessibili rendono semplice l\'installazione dei componenti e l\'espansione della configurazione secondo le proprie necessità; il case è predisposto con cavi preinstallati in caso di upgrade. La memoria RAM da 16GB DDR4 2666MHz, permette rapidi tempi di accesso a programmi aperti; inoltre avrete a disposizione un disco SSD M.2 NVMe da 512GB. Predisposto per tutte le tecnologie più moderne del mercato, inoltre la GeForce RTX 2080 con 8GB di memoria GDDR6 garantisce un\'esperienza gaminig davvero mozzafiato. ','img/prodotti/TechLord_Trident',1),(165,21,0,2096.29,'Litiografia a 14nm, numero di core 18, numero di thread 36, frequenza di base 3.00Ghz, frequenza turbo massima 4.40Ghz, 24.75Mb Smart Cache ','Intel',4,'Intel Core I9','i9-9980XE','Cpu_comp','La famiglia di processori sbloccati Intel® Core™ serie X è stata progettata per scalare le tue esigenze prestazionali utilizzando i due core più veloci a frequenze superiori e fino a 18 core quando hai bisogno di lavorare in megatasking estremo, sia che tu stia creando il tuo lungometraggio più recente o il prossimo episodio di una serie su YouTube*. Goditi prestazioni estreme, videografica 4K immersiva, storage e memoria ad alta velocità e le più recenti innovazioni tecnologiche, il tutto creato per consentirti di passare con la massima velocità dalla fase di progettazione al prodotto finale.','img/prodotti/Intel_I9',1),(300,22,0,202.8,'Nvidia Turing Architecture, 898 Cuda Cores, 8000Mhz memory clock, 4gb GDDR5','MSI',1,'MSI XS GTX 1650 ','GTX 1650','Gpu_comp','Ecco la nuova GTX 1650, con la nuova architettura Turing. Preparati a ottenere Fast and Game Strong. La nuova GTX 1650 è dotata di 896x CUDA Cores, memoria GDDR5 8000Mhz da 4Gb e supporto per Nvidia Ansel, Highlights, GeForce Experience e offre anche la compatibilità G-Sync. Aggiorna facilmente il tuo PC e prepara il gioco, Ottieni prestazioni straordinarie e qualità delle immagini mentre vivi su Twitch o YouTube. Turing shader consentono di aumentare le prestazioni impressionanti sui giochi di oggi. Ottieni un\'efficienza energetica 1.4X rispetto alla generazione precedente per un\'esperienza di gioco più veloce, più fresca e silenziosa che sfrutta le funzionalità grafiche avanzate di Turing. Una GPU Nvidia 16 Series è un supercharger veloce per i giochi più popolari di oggi, e ancora più veloce con titoli moderni.','img/prodotti/MSI_1650',1),(2350,23,0,7999,'Intel® Core™ i9 9980XE (18 core, 24,75 MB di cache, fino a 4,5 GHz con tecnologia Intel® Turbo Boost Max 3.0), Doppia scheda grafica NVIDIA® GeForce® RTX 2080 Ti OC con 11 GB di memoria GDDR6, 32 GB di memoria DDR4 XMP HyperX™ a quattro canali a 2.933 MHz,SSD PCIe M.2 da 1 TB','Alienware',3,'Alienware Area-51','Area-51','Pc_comp','Un concentrato di prestazioni: Alienware Area-51 con processori Intel® Core™ offre prestazioni imbattibili. Scegli tra un processore Intel Core i7, i9 oppure i9 Extreme con tecnologia Turbo Boost Max 3.0 per funzionalità megatasking estreme. Registra, gioca ed esegui lo streaming contemporaneamente con risoluzioni 4K con la possibilità di scegliere un massimo di 18 core. Sono state aggiunte ulteriori prese di ventilazione e ventole per incrementare il raffreddamento attivo tramite ventilazione e l\'emissione di calore dal bordo posteriore. Inoltre, saranno presto supportate due unità U.2. ','img/prodotti/area51-desktop',1);
/*!40000 ALTER TABLE `prodotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spedizione`
--

DROP TABLE IF EXISTS `spedizione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `spedizione` (
  `ID_spedizione` int(11) NOT NULL AUTO_INCREMENT,
  `stato` varchar(20) NOT NULL,
  `data_partenza` date NOT NULL,
  `data_arrivo` date DEFAULT NULL,
  `citta_destinazione` varchar(20) NOT NULL,
  `fattura` int(11) NOT NULL,
  PRIMARY KEY (`ID_spedizione`),
  KEY `fattura` (`fattura`),
  CONSTRAINT `spedizione_ibfk_1` FOREIGN KEY (`fattura`) REFERENCES `fattura` (`numero_fattura`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spedizione`
--

LOCK TABLES `spedizione` WRITE;
/*!40000 ALTER TABLE `spedizione` DISABLE KEYS */;
INSERT INTO `spedizione` VALUES (1,'Processing','2019-08-01','2019-08-12','Pagani',2),(2,'Processing','2019-08-01','2019-08-12','San marzano',1);
/*!40000 ALTER TABLE `spedizione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `utente` (
  `Email` varchar(50) NOT NULL,
  `Tipo` varchar(15) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `Cognome` varchar(30) NOT NULL,
  `Via` varchar(30) DEFAULT NULL,
  `cap` char(5) DEFAULT NULL,
  `NumeroCivico` int(2) DEFAULT NULL,
  `NumeroTelefono` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES ('antonio.baldi98@gmail.com','user','password','antonio','baldi','via e. berlinguer ','84010',51,'3922412988'),('antoniobaldi7575@gmail.com','admin','admin','anton','bald','via umberto I','84010',23,'3921234121'),('francesco.lauro@gmail.com','user','password','Francesco','Lauro','via fontana','84016',65,'3981729210');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-19 12:53:24

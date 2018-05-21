using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Windows.Input;
using System.Windows.Forms;
using System.Drawing;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Diagnostics;
using System.IO;
using FluentAssert;
using System.Threading;

namespace Battleship.Ascii.UITests
{
    /// <summary>
    /// Summary description for CodedUITest1
    /// </summary>
    [TestClass]
    public class PlayGameTest
    {
        public PlayGameTest()
        {
        }

        List<string> shipPositions = new List<string>()
        {
            "A1", "A2", "A3", "A4", "A5",
            "B1", "B2", "B3", "B4",
            "C1", "C2", "C3",
            "D1", "D2", "D3",
            "E1", "E2"
        };

        //[TestMethod]
        [TestCategory("UI")]
        [DeploymentItem("Battleship.Ascii.exe")]
        public void PlayGameAndHitComputerShip()
        {
            var application = Process.Start(@"Battleship.Ascii.exe");

            try
            {
                Thread.Sleep(1000);

                foreach (var position in shipPositions)
                {
                    SendKeys.SendWait(position);
                    SendKeys.SendWait("{Enter}");
                }

                SendKeys.SendWait("A3{Enter}");

                Thread.Sleep(1000);

                Clipboard.Clear();
                SendKeys.SendWait("^a");
                Thread.Sleep(500);
                SendKeys.SendWait("{Enter}");

                Thread.Sleep(2000);
                string consoleContent = (string)Clipboard.GetData(DataFormats.Text);

                if (consoleContent != null)
                {
                    consoleContent.ShouldContain("Yeah ! Nice hit !");
                }
                else
                {
                    Assert.Fail("Console Content was null");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                application.Kill();
            }
        }

        private void Process_OutputDataReceived(object sender, System.Diagnostics.DataReceivedEventArgs e)
        {
            throw new NotImplementedException();
        }

        #region Additional test attributes

        // You can use the following additional attributes as you write your tests:

        ////Use TestInitialize to run code before running each test 
        //[TestInitialize()]
        //public void MyTestInitialize()
        //{        
        //    // To generate code for this test, select "Generate Code for Coded UI Test" from the shortcut menu and select one of the menu items.
        //}

        ////Use TestCleanup to run code after each test has run
        //[TestCleanup()]
        //public void MyTestCleanup()
        //{        
        //    // To generate code for this test, select "Generate Code for Coded UI Test" from the shortcut menu and select one of the menu items.
        //}

        #endregion

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }
        private TestContext testContextInstance;
    }
}

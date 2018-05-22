using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;

namespace Battleship.GameController.Tests
{
    public class SampleTests
    {
        [Test]
        public void ThisIsATest()
        {
            //Arrange
            var addend1 = 5;
            var addend2 = 7;
            //Act
            var result = Add(addend1, addend2);
            //Assert
            Assert.AreEqual(12, result);
        }

        [TestCase(5,7,12)]
        [TestCase(-5,7,2)]
        [TestCase(-5,-7,-12)]
        [TestCase(5,-7,-2)]
        [TestCase(0,0,0)]
        public void ThisIsADataDrivenTest(int addend1, int addend2, int result)
        {
            Assert.AreEqual(result,Add(addend1,addend2));
        }

        [Test]
        public void ShouldCheckForException()
        {
            Assert.Throws<ArgumentNullException>(() => throw new ArgumentNullException());
        }

        private int Add(int addend1, int addend2)
        {
            return addend1 + addend2;
        }
    }
}

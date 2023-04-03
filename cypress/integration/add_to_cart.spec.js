describe('add to cart', () => {
  
  // visits homepage
  beforeEach(() => {
    cy.visit('http://localhost:3000')
  })

  it("should add an item to the cart and update the cart count'", () => {

    const productName = "Void Fennel"

    cy.get('.products')
      .contains(productName)
      .parents('article')
      .within(() => {
        cy.get('button').click({force: true});
      });
    
    cy.get('.navbar-nav').contains('My Cart').should('have.text', ' \n          My Cart (1) ');
    
  });


})
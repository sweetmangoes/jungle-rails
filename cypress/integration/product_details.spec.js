describe('product details', () => {
  
  // visits homepage
  beforeEach(() => {
    cy.visit('http://localhost:3000')
  })

  it("going to the product page", () => {
    // clicks on product partials 
    cy.get('img[alt="Enirthelda"]').click(); 
    cy.url().should('include', '/products/5');
  });

  // it("going to the product page", () => {
  //   // clicks on product partials 
  //   cy.get('nav').contains('Trees').click();
  //   cy.url().should('include', '/categories/3');
  // });

})

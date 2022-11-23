describe('add to cart', () => {
  it("should changes the count of the cart button when adding products to it", () => {
    cy.visit('/');
    cy.contains("My Cart (0)");
    cy.get('.products article .btn').first().click({force: true});
    cy.contains("My Cart (1)");
  });

});
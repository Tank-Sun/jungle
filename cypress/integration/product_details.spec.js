describe('product details', () => {
  beforeEach(() => {
    cy.visit('/');
    cy.get('.products article').first().click()
  });
  it("There is product on the page", () => {
    cy.get(".products-show article").should("be.visible");
  });
  it("There is 1 product on the page", () => {
    cy.get(".products-show article").should("have.length", 1);
  });

});
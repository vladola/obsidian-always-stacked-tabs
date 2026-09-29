// Keeps every tab group in the main editor area stacked, so notes slide in to the right
// Andy Matuschak-style even after the layout is rebuilt (startup, Homepage, splits…).
const { Plugin } = require("obsidian");
module.exports = class AlwaysStackedTabs extends Plugin {
  onload() {
    const stack = () => {
      this.app.workspace.iterateRootLeaves((leaf) => {
        const group = leaf.parent;
        if (group && typeof group.setStacked === "function" && !group.isStacked) group.setStacked(true);
      });
    };
    this.app.workspace.onLayoutReady(() => {
      stack();
      this.registerEvent(this.app.workspace.on("layout-change", stack));
    });
  }
};

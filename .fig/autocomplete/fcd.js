const USERNAME = "cjdenio";

var completionSpec = {
  name: "fcd",
  args: {
    name: "repo",
    generators: {
      script: "fgh visualize --ownerName",
      postProcess(out) {
        return out
          .split("\n")
          .filter((v, i) => i % 2 == 0)
          .map((i) => {
            let name = i;

            if (i.startsWith(`${USERNAME}/`)) {
              name = i.split("/")[1];
            }

            return {
              name,
            };
          });
      },
    },
  },
};

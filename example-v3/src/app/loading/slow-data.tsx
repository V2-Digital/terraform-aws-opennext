import { use } from "react";

const fakeFetchSlowData = () => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve({
        data: {
          title: "Slow data",
          description: "This data was fetched after 5 seconds",
        },
      });
    }, 5000);
  });
};

export default function SlowData() {
  const data = use(fakeFetchSlowData());
  return (
    <pre>
      <code>{JSON.stringify(data, null, 2)}</code>
    </pre>
  );
}
